// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';
import 'package:dice_client/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  late WebSocketChannel _channelLobby;
  late WebSocketChannel _channelMm;
  late UserProvider _userProvider;
  late LobbyUserProvider _lobbyUserProvider;
  late LobbyMatchProvider _lobbyMatchProvider;
  late LobbyChallengeProvider _lobbyChallengeProvider;

  final ValueNotifier<bool> _searching = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _lobbyUserProvider = Provider.of<LobbyUserProvider>(context, listen: false);
    _lobbyMatchProvider = Provider.of<LobbyMatchProvider>(context, listen: false);
    _lobbyChallengeProvider = Provider.of<LobbyChallengeProvider>(context, listen: false);

    _channelLobby = WebSocketChannel.connect(Uri.parse("$WSENDPOINT/lobby?id=${_userProvider.user.id}"));

    _channelLobby.stream.listen((event) {
      if (event != null) {
        DataEvent data = DataEvent.fromJson(jsonDecode(event));
        if (data.event == "join") {
          User user = User.fromJson(data.params!);

          _lobbyUserProvider.addUser(user);
        } else if (data.event == "ping") {
          _channelLobby.sink.add("pong");
        } else if (data.event == "leave") {
          _lobbyUserProvider.removeUser(data.params!["id"]);
        } else if (data.event == "match_leader") {
          http.get(Uri.parse("$HTTPENDPOINT/match_leader")).then((value) {
            List<dynamic> data = jsonDecode(value.body);

            if (data.isNotEmpty) {
              List<MatchLeaderboard> matchs = [];
              for (var e in data) {
                matchs.add(MatchLeaderboard.fromJson(e));
              }

              _lobbyMatchProvider.addMatchs(matchs);
            }
          });
        } else if (data.event == "chal_leader") {
          http.get(Uri.parse("$HTTPENDPOINT/chal_leader")).then((value) {
            List<dynamic> data = jsonDecode(value.body);

            if (data.isNotEmpty) {
              List<ChallengeLeaderboard> challenges = [];
              for (var e in data) {
                challenges.add(ChallengeLeaderboard.fromJson(e));
              }

              _lobbyChallengeProvider.addChallenges(challenges);
            }
          });
        }
      }
    }, onError: (e) {}, onDone: (() {}), cancelOnError: true);

    _channelLobby.ready.then(
      (value) {
        if (!_lobbyUserProvider.isCalled) {
          http.get(Uri.parse("$HTTPENDPOINT/online")).then(
            (value) {
              List data = jsonDecode(value.body);

              if (data.isNotEmpty) {
                List<User> users = [];
                for (var i in data) {
                  users.add(User.fromJson(i));
                }

                int indexUser = users.indexWhere((element) => element.id == _userProvider.user.id);

                users.insert(0, users[indexUser]);
                users.removeAt(indexUser + 1);

                _lobbyUserProvider.addUsers(users);
              }
            },
          );
        }

        if (!_lobbyMatchProvider.isCalled) {
          http.get(Uri.parse("$HTTPENDPOINT/match_leader")).then(
            (value) {
              List<dynamic> data = jsonDecode(value.body);

              if (data.isNotEmpty) {
                List<MatchLeaderboard> matchs = [];
                for (var e in data) {
                  matchs.add(MatchLeaderboard.fromJson(e));
                }

                _lobbyMatchProvider.addMatchs(matchs);
              }
            },
          );
        }

        if (!_lobbyChallengeProvider.isCalled) {
          http.get(Uri.parse("$HTTPENDPOINT/chal_leader")).then((value) {
            List<dynamic> data = jsonDecode(value.body);

            if (data.isNotEmpty) {
              List<ChallengeLeaderboard> challenges = [];
              for (var e in data) {
                challenges.add(ChallengeLeaderboard.fromJson(e));
              }

              _lobbyChallengeProvider.addChallenges(challenges);
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background/background.png'),
        )),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 35,
              child: Image(
                height: 150,
                image: AssetImage('assets/images/logo/logodazzdice.png'),
              ),
            ),
            Positioned(
              left: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 300,
                  height: 400,
                  child: Card(
                    child: Column(
                      children: [
                        const ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                          tileColor: Color.fromARGB(255, 30, 30, 30),
                          title: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Color.fromARGB(255, 165, 214, 167),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Online",
                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
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
                                    '${user.items[index].name}#${user.items[index].decorator}${(_userProvider.user.id == user.items[index].id) ? " (me)" : ""}',
                                    style: (_userProvider.user.id == user.items[index].id)
                                        ? const TextStyle(fontWeight: FontWeight.bold)
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      http
                          .get(Uri.parse("$HTTPENDPOINT/create_challenge?id=${_userProvider.user.id}"))
                          .then((value) {
                        Challenge challenge = Challenge.fromJson(jsonDecode(value.body));
                        Provider.of<ChallengeProvider>(context, listen: false).setChallenge(challenge);
                        context.pushNamed('singleplayer');
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                    child: const Text(
                      "Single Player",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SizedBox(
                              width: 100,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text("Searching..."),
                                  ),
                                  const CircularProgressIndicator(),
                                  ElevatedButton(
                                    onPressed: () {
                                      _channelMm.sink.close();
                                      context.pop();
                                    },
                                    child: const Text("Cancel"),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );

                      _channelMm =
                          WebSocketChannel.connect(Uri.parse("$WSENDPOINT/mm?id=${_userProvider.user.id}"));
                      _channelMm.stream.listen((event) {
                        if (event != null) {
                          DataEvent data = DataEvent.fromJson(jsonDecode(event));

                          if (data.event == "match") {
                            _channelMm.sink.close();

                            Provider.of<MatchProvider>(context, listen: false)
                                .setMatch(Match.fromJson(data.params!["match"]));

                            context.pop();
                            context.pushNamed("vsplayer");
                          } else if (data.event == "no_enemy") {
                            _channelMm.sink.close();
                            _searching.value = false;
                          }
                        }
                      });

                      _channelMm.sink.add(
                        jsonEncode(
                          DataEvent(
                            event: "search_opponent",
                            sender: _userProvider.user.id,
                          ).toJson(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                    child: const Text(
                      "VS Player",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                    onPressed: () {
                      context.goNamed('/');
                    },
                    child: const Text("Exit", style: TextStyle(fontSize: 22, color: Colors.white)),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 60,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 300,
                  height: 400,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 30, 30, 30),
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          ),
                          child: const Center(
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
                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                        DefaultTabController(
                          length: 2,
                          child: SizedBox(
                            height: 300,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Colors.black,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  tabs: [
                                    Tab(text: 'Single Player'),
                                    Tab(text: 'VS Player'),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBarView(
                                      children: [
                                        ScrollConfiguration(
                                          behavior: ScrollConfiguration.of(context).copyWith(
                                            dragDevices: {
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.mouse,
                                            },
                                          ),
                                          child: Consumer<LobbyChallengeProvider>(
                                            builder: (context, provider, _) {
                                              return ListView.separated(
                                                itemCount: provider.challengeLeaderboard.length,
                                                separatorBuilder: (context, index) {
                                                  return const SizedBox(
                                                    height: 8,
                                                  );
                                                },
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height: 32,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            provider.challengeLeaderboard[index].rank?.toString() ?? '',
                                                            style: const TextStyle(
                                                                fontSize: 20, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius.all(Radius.circular(10)),
                                                                color: Colors.green.shade200),
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${provider.challengeLeaderboard[index].player?.name}#${provider.challengeLeaderboard[index].player?.decorator}${(_userProvider.user.id == provider.challengeLeaderboard[index].playerId) ? " (me)" : ""}',
                                                                    style: const TextStyle(fontSize: 18),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons.star,
                                                                        color: Colors.yellow.shade300,
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Text(
                                                                          provider.challengeLeaderboard[index].score
                                                                                  ?.toString() ??
                                                                              '',
                                                                          style: const TextStyle(fontSize: 18))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        ScrollConfiguration(
                                          behavior: ScrollConfiguration.of(context).copyWith(
                                            dragDevices: {
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.mouse,
                                            },
                                          ),
                                          child: Consumer<LobbyMatchProvider>(
                                            builder: (context, provider, _) {
                                              return ListView.separated(
                                                itemCount: provider.matchLeaderboard.length,
                                                separatorBuilder: (context, index) {
                                                  return const SizedBox(
                                                    height: 8,
                                                  );
                                                },
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height: 32,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            provider.matchLeaderboard[index].rank?.toString() ?? '',
                                                            style: const TextStyle(
                                                                fontSize: 20, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius.all(Radius.circular(10)),
                                                                color: Colors.green.shade200),
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${provider.matchLeaderboard[index].player?.name}#${provider.matchLeaderboard[index].player?.decorator}${(_userProvider.user.id == provider.matchLeaderboard[index].playerId) ? " (me)" : ""}',
                                                                    style: const TextStyle(fontSize: 18),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons.star,
                                                                        color: Colors.yellow.shade300,
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Text(
                                                                          provider.matchLeaderboard[index].rating
                                                                                  ?.toString() ??
                                                                              '',
                                                                          style: const TextStyle(fontSize: 18))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
    _channelLobby.sink.close();
    _lobbyChallengeProvider.onDispose();
    _lobbyMatchProvider.onDispose();
    _lobbyUserProvider.onDispose();
    _userProvider.onDispose();
    super.dispose();
  }
}
