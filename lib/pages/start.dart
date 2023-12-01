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
  final String _address = 'localhost';
  final String _port = "3000";

  final TextEditingController _namaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<String?> _inputName() {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          content: Container(
            width: 330,
            height: 220,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Anda belum terdaftar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                        labelText: 'Masukkan nama Anda',
                      ),
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
                  height: 25,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.pop(_namaController.text);
                        }
                      },
                      child: const Text("Masuk",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
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
        if (value != null && value.isNotEmpty) {
          http
              .post(Uri.parse("http://$_address:$_port/create/?name=$value"))
              .then(
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
          decoration: BoxDecoration(
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
                  image: AssetImage('assets/images/logo/logodazzdice.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image(
                height: 0.25.sh,
                image: AssetImage('assets/images/logo/logodice.png'),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.pink.shade100),
                  child: const Text("Start",
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  onPressed: () {
                    //_inputName();
                    context.pushNamed("lobby");
                    // SharedPreferences.getInstance().then((prefs) {
                    //   String? id = prefs.getString('id');
                    //   if (id == null) {
                    //     createUser(prefs);
                    //   } else {
                    //     http
                    //         .get(Uri.parse("http://$_address:$_port/check?id=$id"))
                    //         .then((value) {
                    //       Map<String, dynamic> res = jsonDecode(value.body);
                    //       if (!res["status"]) {
                    //         createUser(prefs);
                    //       } else {
                    //         Provider.of<UserProvider>(context, listen: false)
                    //             .setUser(User.fromJson(res["user"]));
                    //         context.pushNamed("lobby");
                    //       }
                    //     });
                    //   }
                    // });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.pink.shade100),
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
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            content: Container(
                              width: 350,
                              height: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Information",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: 'DazzDize ',
                                          style: TextStyle(
                                              color: Colors.blue[200],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                'adalah permainan dadu yang dapat meningkatkan kemampuan menghitung anak dan dapat membantu anak mengembangkan konsep bilangan dan lambang bilangan. Melalui permainan ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                        TextSpan(
                                            text: 'DazzDice',
                                            style: TextStyle(
                                                color: Colors.blue[200],
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                ', anak dapat mengasah kreativitas, imajinasi, kemampuan berpikir logis, dan sistematis.',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal))
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
