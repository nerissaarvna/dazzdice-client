// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';
import 'package:dice_client/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final String _address = 'localhost';
  final String _port = "3000";

  WebSocketChannel? _channelLobby;
  WebSocketChannel? _channelMm;

  @override
  void initState() {
    _channelLobby ??= Provider.of<LobbyConnProvider>(context, listen: false).init(
        context,
        Uri.parse(
            "ws://$_address:$_port/lobby?id=${Provider.of<UserProvider>(context, listen: false).user.id}"));

    _channelLobby!.ready.then((value) {
      if (!Provider.of<LobbyUserProvider>(context, listen: false).isCalled) {
        print("called");
        http.get(Uri.parse("http://localhost:3000/online")).then((value) {
          Map<dynamic, dynamic> data = jsonDecode(value.body);

          if (data.isNotEmpty) {
            List<User> users = [];
            data.forEach((key, value) {
              users.add(User.fromJson(value));
            });

            Provider.of<LobbyUserProvider>(context, listen: false)
                .addUsers(users);
          }
        });
      }

      if (!Provider.of<LobbyHistoryProvider>(context, listen: false).isCalled) {
        http.get(Uri.parse("http://localhost:3000/history")).then((value) {
          List<dynamic> data = jsonDecode(value.body);

          if (data.isNotEmpty) {
            List<Match> matchs = [];
            for (var e in data) {
              matchs.add(Match.fromJson(e));
            }

            Provider.of<LobbyHistoryProvider>(context, listen: false)
                .addMatchs(matchs);
          }
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 0.25.sw,
              height: 0.5.sh,
              child: Card(
                child: Column(
                  children: [
                    const ListTile(
                      tileColor: Colors.amber,
                      title: Center(
                        child: Text("Online"),
                      ),
                    ),
                    Flexible(
                      child: Consumer<LobbyUserProvider>(
                        builder: (context, user, _) => ListView.builder(
                          itemCount: user.items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                user.items[index].name,
                                style: (Provider.of<UserProvider>(context)
                                            .user
                                            .id ==
                                        user.items[index].id)
                                    ? const TextStyle(
                                        fontWeight: FontWeight.bold)
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: ElevatedButton(
                    onPressed: () {
                      _channelMm = WebSocketChannel.connect(Uri.parse(
                          "ws://$_address:$_port/mm?id=${Provider.of<UserProvider>(context, listen: false).user.id}"));
                      _channelMm!.stream.listen((event) {
                        if (event != null) {
                          DataEvent data =
                              DataEvent.fromJson(jsonDecode(event));
                          if (data.event == "on_join_mm") {
                          } else if (data.event == "on_leave_mm") {
                          } else if (data.event == "on_match") {
                            print(data.event);
                            _channelMm!.sink.add(jsonEncode(data));
                          } else if (data.event == "get_enemy") {
                            data.event = "get_match";
                            _channelMm!.sink.add(jsonEncode(data));
                          } else if (data.event == "set_match") {
                            _channelMm!.sink.close();
                            Provider.of<MatchProvider>(context, listen: false)
                                .setMatch(Match.fromJson(data.params));

                            context.pushNamed("arena");
                          } else if (data.event == "no_enemy") {
                            _channelMm!.sink.close();
                            print(data.event);
                          }
                        }
                      });

                      _channelMm!.sink.add(
                        jsonEncode(
                          DataEvent(event: "get_enemy", params: {
                            "id": Provider.of<UserProvider>(context,
                                    listen: false)
                                .user
                                .id
                          }).toJson(),
                        ),
                      );
                    },
                    child: const Text(" VS Player"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: ElevatedButton(
                    onPressed: () {
                      http
                          .post(Uri.parse(
                              "http://$_address:$_port/vscom?id=${Provider.of<UserProvider>(context, listen: false).user.id}"))
                          .then((value) {
                        Provider.of<MatchProvider>(context, listen: false)
                            .setMatch(Match.fromJson(
                                jsonDecode(jsonDecode(value.body))));
                        context.pushNamed("arena");
                      });
                    },
                    child: const Text(" VS COM"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<LobbyUserProvider>(context, listen: false)
                          .clear();
                      Provider.of<LobbyHistoryProvider>(context, listen: false)
                          .clear();
                      context.goNamed('/');
                    },
                    child: const Text("Exit"),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 0.25.sw,
              height: 0.5.sh,
              child: Card(
                child: Column(
                  children: [
                    const ListTile(
                      tileColor: Colors.amber,
                      title: Center(
                        child: Text("Match History"),
                      ),
                    ),
                    Flexible(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: Consumer<LobbyHistoryProvider>(
                          builder: (context, history, _) => ListView.builder(
                            itemCount: history.match.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          width: 80,
                                          child: Text(
                                            history.match[index].players.player1
                                                .player.name,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: (history
                                                        .match[index].winner! ==
                                                    1)
                                                ? const TextStyle(
                                                    fontWeight: FontWeight.bold)
                                                : null,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                        child: Text(
                                          "VS",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          width: 80,
                                          child: Text(
                                            history.match[index].players.player2
                                                .player.name,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: (history
                                                        .match[index].winner! ==
                                                    2)
                                                ? const TextStyle(
                                                    fontWeight: FontWeight.bold)
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            history.match[index].dices.dice1
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                        child: Text(
                                          ":",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            history.match[index].dices.dice2
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channelLobby!.sink.close();
    if (_channelMm != null) _channelMm!.sink.close();
    super.dispose();
  }
}
