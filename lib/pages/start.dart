import 'dart:convert';
import 'package:dice_client/model.dart';
import 'package:dice_client/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _namaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //Untuk masukkin nama
  Future<String?> _inputName() {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          content: Container(
            width: 0.3.sw,
            //height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                Image(
                  image: AssetImage('assets/images/emoticon/hello.png'),
                  height: 0.15.sh,
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  "What's your name?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 30, 30, 30),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                          hintText: 'Your name',
                          labelStyle: TextStyle(fontSize: 16.sp)),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nama Kosong';
                        }
                        if (text.length > 16) {
                          return 'Terlalu panjang, maks. 16 huruf';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                SizedBox(
                  width: 0.11.sw,
                  height: 0.07.sh,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade100),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.pop(_namaController.text);
                        }
                      },
                      child: Text("Masuk",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white))),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void createUser(SharedPreferences prefs) {
    _inputName().then(
      (value) {
        //Cek Ketersediaan dan Non-Empty Nama
        if (value != null && value.isNotEmpty) {
          http.get(Uri.parse("$HTTPENDPOINT/create?name=$value")).then(
            (value) {
              User user = User.fromJson(jsonDecode(value.body));
              prefs.setString("id", user.id);
              Provider.of<UserProvider>(context, listen: false).setUser(user);
              context.pushNamed("lobby");
            },
          );
        }
      },
    );
  }

  Future<bool> checkAvailibility() async {
    print("Checking...");
    var r = false;

    try {
      var res = await http.get(Uri.parse(HTTPENDPOINT));

      if (res.statusCode != 200) {
        HTTPENDPOINT = "https://$ENDPOINT2";
      } else {
        r = true;
      }
    } catch (e) {
      print(e);
    }
    if (!r) {
      HTTPENDPOINT = "https://$ENDPOINT2";
      try {
        var res2 = await http.get(Uri.parse(HTTPENDPOINT));

        if (res2.statusCode != 200) {
          r = false;
        } else {
          r = true;
        }
      } catch (e) {
        print(e);
      }
    }

    return r;
  }

  @override
  void initState() {
    super.initState();
  }

  // Halaman utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/images/background/background.png'), // background
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Image(
                  height: 0.2.sh,
                  image: const AssetImage(
                      'assets/images/logo/logodazzdice.png'), // logo dazzdice
                ),
              ),
              SizedBox(
                height: 0.04.sh,
              ),
              Image(
                height: 0.20.sh,
                image: const AssetImage(
                    'assets/images/logo/logodice.png'), // logo dadu
              ),
              SizedBox(
                height: 0.07.sh,
              ),
              SizedBox(
                height: 0.08.sh,
                width: 0.2.sw,
                // button start
                // kalau pertama kali masuk harus masukkin nama
                // kalau udah pernah masuk langsung menuju lobby
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100),
                  child: Text("Start",
                      style: TextStyle(fontSize: 24.sp, color: Colors.white)),
                  onPressed: () {
                    print("Start");
                    checkAvailibility().then((value) {
                      if (!value) {
                        print("Server mati");
                        return;
                      } else {
                        SharedPreferences.getInstance().then(
                          (prefs) {
                            String? id = prefs.getString('id');
                            if (id == null) {
                              createUser(prefs);
                            } else {
                              http
                                  .get(Uri.parse("$HTTPENDPOINT/user?id=$id"))
                                  .then(
                                (value) {
                                  if (value.statusCode == 200) {
                                    Map<String, dynamic> res =
                                        jsonDecode(value.body);
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .setUser(User.fromJson(res));
                                    context.pushNamed("lobby");
                                  } else if (value.statusCode == 404) {
                                    createUser(prefs);
                                  }
                                },
                              ).onError((error, stack) {
                                if (error is http.ClientException) {}
                              });
                            }
                          },
                        );
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              SizedBox(
                height: 0.08.sh,
                width: 0.2.sw,
                // button information
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.pink.shade100),
                  child: Text(
                    'Information',
                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog<String>(
                        // munculin information
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            content: Container(
                              width: 0.3.sw,
                              //height: 0.2.sh,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    10.sp, 10.sp, 10.sp, 10.sp),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'DazzDice ',
                                            style: TextStyle(
                                                color: Colors.blue[200],
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  'adalah permainan dadu yang dapat meningkatkan kemampuan menghitung anak dan dapat membantu anak mengembangkan konsep bilangan dan lambang bilangan. Melalui permainan ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          TextSpan(
                                              text: 'DazzDice',
                                              style: TextStyle(
                                                  color: Colors.blue[200],
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  ', anak dapat mengasah kreativitas, imajinasi, kemampuan berpikir logis, dan sistematis.',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }
}
