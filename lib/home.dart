import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key, required this.id});

  final String id;

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final String _address = 'localhost';
  final String _port = "3000";

  final List<User> _userList = [];

  late WebSocketChannel _channel;

  @override
  void initState() {
    _channel = WebSocketChannel.connect(
        Uri.parse("ws://$_address:$_port/lobby/${widget.id}"));

    _channel.stream.listen((event) {
      if (event != null) {
        Map<String, dynamic> data = jsonDecode(event);
        if (data["event"] == "on_join") {
          print(data["params"]);
          User user = User.fromJson(data["params"]);

          setState(() {
            _userList.add(user);
          });
        } else if (data["event"] == "on_leave") {
          User user = User.fromJson(data["params"]);

          setState(() {
            _userList.removeWhere((element) => element.id == user.id);
          });
        }
      }
    });

    http.get(Uri.parse("http://localhost:3000/online")).then((value) {
      Map<String, dynamic> data = jsonDecode(value.body);

      if (data.isNotEmpty) {
        List<User> users = [];
        data.forEach((key, value) {
          users.add(User(id: key, name: value));
        });

        setState(() {
          _userList.addAll(users);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_userList.length);
    return Scaffold(
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return Text(_userList[index].name);
        },
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
