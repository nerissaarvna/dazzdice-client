import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  child: const Text("Masuk"))
            ],
          ),
        );
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
              String? id = prefs.getString('id');
              if (id == null) {
                id = const Uuid().v4().split("-")[0];
                prefs.setString("id", id);
              }

              http
                  .get(Uri.parse("http://$_address:$_port/check/$id"))
                  .then((value) {
                if (!jsonDecode(value.body)["status"]) {
                  _inputName().then((value) {
                    http
                        .post(Uri.parse(
                            "http://$_address:$_port/create/$id/?name=$value"))
                        .then((value) {
                      if (jsonDecode(value.body)["status"]) {
                        context.goNamed("lobby", pathParameters: {"id": id!});
                      }
                    });
                  });
                } else {
                  context.goNamed("lobby", pathParameters: {"id": id!});
                }
              });
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
