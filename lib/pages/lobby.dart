import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';
import 'package:dice_client/providers.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key, required this.id});

  final String id;

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final String _address = 'localhost';
  final String _port = "3000";

  late WebSocketChannel _channelLobby;
  late WebSocketChannel _channelMm;

  @override
  void initState() {
    _channelLobby = WebSocketChannel.connect(
        Uri.parse("ws://$_address:$_port/lobby/${widget.id}"));

    _channelLobby.stream.listen((event) {
      if (event != null) {
        Map<String, dynamic> data = jsonDecode(event);
        if (data["event"] == "on_join") {
          User user = User.fromJson(data["params"]);

          Provider.of<LobbyUserProvider>(context, listen: false).addUser(user);
        } else if (data["event"] == "on_leave") {
          User user = User.fromJson(data["params"]);

          Provider.of<LobbyUserProvider>(context, listen: false)
              .removeUser(user);
        }
      }
    });

    _channelLobby.ready.then((value) {
      print("connected");
      http.get(Uri.parse("http://localhost:3000/online")).then((value) {
        Map<String, dynamic> data = jsonDecode(value.body);

        if (data.isNotEmpty) {
          List<User> users = [];
          data.forEach((key, value) {
            users.add(User(id: key, name: value));
          });

          Provider.of<LobbyUserProvider>(context, listen: false)
              .addUsers(users);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SizedBox(
              height: 300,
              width: 200,
              child: Consumer<LobbyUserProvider>(
                builder: (context, user, _) => ListView.builder(
                  itemCount: user.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(user.items[index].name),
                    );
                  },
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _channelMm = WebSocketChannel.connect(
                          Uri.parse("ws://$_address:$_port/mm/${widget.id}"));
                      _channelMm.stream.listen((event) {
                        if (event != null) {
                          Map<String, dynamic> data = jsonDecode(event);
                          if (data["event"] == "on_join_mm") {
                          } else if (data["event"] == "on_leave_mm") {
                          } else if (data["event"] == "on_match") {
                          } else if (data["event"] == "get_enemy") {
                            data["event"] = "get_match";
                            _channelMm.sink.add(jsonEncode(data));
                          } else if (data["event"] == "set_match") {
                            _channelMm.sink.close();
                            if (widget.id == data["params"]["id"]) {
                              context.goNamed("arena", pathParameters: {
                                "id": widget.id,
                                "match_id": data["params"]["match_id"],
                                "player": "1"
                              });
                            } else {
                              context.goNamed("arena", pathParameters: {
                                "id": widget.id,
                                "match_id": data["params"]["match_id"],
                                "player": "2"
                              });
                            }
                          }
                        }
                      });
                      _channelMm.sink.add(jsonEncode({
                        'event': 'get_enemy',
                        'params': {'id': widget.id}
                      }));
                    },
                    child: const Text(" VS Player"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(" VS COM"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channelLobby.sink.close();
    _channelMm.sink.close();
    super.dispose();
  }
}
