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
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Anda belum terdaftar"),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      labelText: 'Masukkan nama',
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
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.pop(_namaController.text);
                    }
                  },
                  child: const Text("Enter"))
            ],
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
              prefs.setInt("id", user.id);
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
        child: ElevatedButton(
          child: const Text("Start"),
          onPressed: () {
            SharedPreferences.getInstance().then((prefs) {
              int? id = prefs.getInt('id');
              if (id == null) {
                createUser(prefs);
              } else {
                http
                    .get(Uri.parse("http://$_address:$_port/check?id=$id"))
                    .then((value) {
                  Map<String, dynamic> res = jsonDecode(value.body);
                  if (!res["status"]) {
                    createUser(prefs);
                  } else {
                    Provider.of<UserProvider>(context, listen: false)
                        .setUser(User.fromJson(res["user"]));
                    context.pushNamed("lobby");
                  }
                });
              }
            });
          },
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
