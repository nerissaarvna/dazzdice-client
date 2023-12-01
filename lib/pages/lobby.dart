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

  final ValueNotifier<bool> _searching = ValueNotifier<bool>(true);

  @override
  void initState() {
    // _channelLobby ??= Provider.of<LobbyConnProvider>(context, listen: false).init(
    //     context,
    //     Uri.parse(
    //         "ws://$_address:$_port/lobby?id=${Provider.of<UserProvider>(context, listen: false).user.id}"));

    // _channelLobby!.ready.then((value) {
    //   if (!Provider.of<LobbyUserProvider>(context, listen: false).isCalled) {
    //     print("called");
    //     http.get(Uri.parse("http://localhost:3000/online")).then((value) {
    //       Map<dynamic, dynamic> data = jsonDecode(value.body);

    //       if (data.isNotEmpty) {
    //         List<User> users = [];
    //         data.forEach((key, value) {
    //           users.add(User.fromJson(value));
    //         });

    //         Provider.of<LobbyUserProvider>(context, listen: false)
    //             .addUsers(users);
    //       }
    //     });
    //   }

    //   if (!Provider.of<LobbyHistoryProvider>(context, listen: false).isCalled) {
    //     http.get(Uri.parse("http://localhost:3000/history")).then((value) {
    //       List<dynamic> data = jsonDecode(value.body);

    //       if (data.isNotEmpty) {
    //         List<Match> matchs = [];
    //         for (var e in data) {
    //           matchs.add(Match.fromJson(e));
    //         }

    //         Provider.of<LobbyHistoryProvider>(context, listen: false)
    //             .addMatchs(matchs);
    //       }
    //     });
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background/background.png'),
        )),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Image(
                    height: 0.17.sh,
                    image: AssetImage('assets/images/logo/logodazzdice.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 0.25.sw,
                  height: 0.5.sh,
                  child: Card(
                    child: Column(
                      children: [
                        const ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          tileColor: Color.fromARGB(255, 30, 30, 30),
                          title: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Color.fromARGB(255, 205, 226, 81),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Online",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )
                              ],
                            ),
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
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.pushNamed("satuplayer");
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100,
                          fixedSize: Size(150, 40)),
                      child: const Text(
                        "Player 1",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.pushNamed("duaplayer");
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100,
                          fixedSize: Size(150, 40)),
                      child: const Text(
                        "Player 2",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )),
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100,
                          fixedSize: Size(150, 40)),
                      onPressed: () {
                        Provider.of<LobbyUserProvider>(context, listen: false)
                            .clear();
                        Provider.of<LobbyHistoryProvider>(context,
                                listen: false)
                            .clear();
                        context.goNamed('/');
                      },
                      child: const Text("Exit",
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.25.sw,
                  height: 0.5.sh,
                  child: Card(
                    child: Column(
                      children: [
                        const ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          tileColor: Color.fromARGB(255, 30, 30, 30),
                          title: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 250, 240, 175),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Leaderboard",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )
                              ],
                            ),
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
                              builder: (context, history, _) =>
                                  ListView.builder(
                                itemCount: history.match.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: SizedBox(
                                              width: 80,
                                              child: Text(
                                                history.match[index].players
                                                    .player1.player.name,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: (history.match[index]
                                                            .winner! ==
                                                        1)
                                                    ? const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)
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
                                                history.match[index].players
                                                    .player2.player.name,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: (history.match[index]
                                                            .winner! ==
                                                        2)
                                                    ? const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
            ),
          ],
        ),
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
