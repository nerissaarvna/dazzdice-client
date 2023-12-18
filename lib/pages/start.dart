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

  Future<String?> _inputName() {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          content: Container(
            width: 330,
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('assets/images/emoticon/hello.png'),
                  height: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "What's your name?",
                  style: TextStyle(color: Color.fromARGB(255, 30, 30, 30), fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _namaController,
                      decoration: const InputDecoration(hintText: 'Your name'),
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
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.pop(_namaController.text);
                        }
                      },
                      child: const Text("Masuk", style: TextStyle(fontSize: 20, color: Colors.white))),
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
          http.get(Uri.parse("$HTTPENDPOINT/create/?name=$value")).then(
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background/background.png'),
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Image(
                  height: 0.25.sh,
                  image: const AssetImage('assets/images/logo/logodazzdice.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image(
                height: 0.25.sh,
                image: const AssetImage('assets/images/logo/logodice.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                  child: const Text("Start", style: TextStyle(fontSize: 24, color: Colors.white)),
                  onPressed: () {
                    SharedPreferences.getInstance().then(
                      (prefs) {
                        String? id = prefs.getString('id');
                        if (id == null) {
                          createUser(prefs);
                        } else {
                          http.get(Uri.parse("$HTTPENDPOINT/user?id=$id")).then(
                            (value) {
                              if (value.statusCode == 200) {
                                Map<String, dynamic> res = jsonDecode(value.body);
                                Provider.of<UserProvider>(context, listen: false).setUser(User.fromJson(res));
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
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.pink.shade100),
                  child: const Text(
                    'Information',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            content: Container(
                              width: 350,
                              height: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Information",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: 'DazzDize ',
                                          style: TextStyle(
                                              color: Colors.blue[200], fontSize: 16, fontWeight: FontWeight.bold),
                                          children: <TextSpan>[
                                        const TextSpan(
                                            text:
                                                'adalah permainan dadu yang dapat meningkatkan kemampuan menghitung anak dan dapat membantu anak mengembangkan konsep bilangan dan lambang bilangan. Melalui permainan ',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                                        TextSpan(
                                            text: 'DazzDice',
                                            style: TextStyle(
                                                color: Colors.blue[200], fontSize: 16, fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                            text:
                                                ', anak dapat mengasah kreativitas, imajinasi, kemampuan berpikir logis, dan sistematis.',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal))
                                      ])),
                                ],
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
