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
    _lobbyMatchProvider =
        Provider.of<LobbyMatchProvider>(context, listen: false);
    _lobbyChallengeProvider =
        Provider.of<LobbyChallengeProvider>(context, listen: false);

    _channelLobby = WebSocketChannel.connect(
        Uri.parse("$WSENDPOINT/lobby?id=${_userProvider.user.id}"));

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

                int indexUser = users.indexWhere(
                    (element) => element.id == _userProvider.user.id);

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

  // Halaman lobby game
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              'assets/images/background/background.png'), // background
        )),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 35,
              child: Image(
                height: 0.2.sh,
                image: AssetImage(
                    'assets/images/logo/logodazzdice.png'), // logo dazzdice
              ),
            ),
            Positioned(
              // List lawan yang online
              left: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 0.25.sw,
                  height: 0.5.sh,
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
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
                                  color: Color.fromARGB(255, 165, 214, 167),
                                  size: 25.sp,
                                ),
                                SizedBox(
                                  width: 0.01.sw,
                                ),
                                Text(
                                  "Online",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300),
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
                                    style: (_userProvider.user.id ==
                                            user.items[index].id)
                                        ? TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold)
                                        : TextStyle(
                                            fontSize: 16.sp,
                                          ),
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
                  height: 0.08.sh,
                  width: 0.18.sw,
                  child: ElevatedButton(
                    // button single player
                    onPressed: () {
                      http
                          .get(Uri.parse(
                              "$HTTPENDPOINT/create_challenge?id=${_userProvider.user.id}"))
                          .then((value) {
                        Challenge challenge =
                            Challenge.fromJson(jsonDecode(value.body));
                        Provider.of<ChallengeProvider>(context, listen: false)
                            .setChallenge(challenge);
                        context.pushNamed('singleplayer');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100),
                    child: Text(
                      "Single Player",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                SizedBox(
                  height: 0.08.sh,
                  width: 0.18.sw,
                  child: ElevatedButton(
                    // button vs player
                    onPressed: () {
                      showDialog(
                        // pencarian lawan yang online
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SizedBox(
                              width: 0.1.sw,
                              height: 0.1.sw,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Searching...",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
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

                      _channelMm = WebSocketChannel.connect(Uri.parse(
                          "$WSENDPOINT/mm?id=${_userProvider.user.id}"));
                      _channelMm.stream.listen((event) {
                        if (event != null) {
                          DataEvent data =
                              DataEvent.fromJson(jsonDecode(event));

                          if (data.event == "match") {
                            _channelMm.sink.close();

                            Provider.of<MatchProvider>(context, listen: false)
                                .setMatch(
                                    Match.fromJson(data.params!["match"]));

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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100),
                    child: Text(
                      "VS Player",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 0.05.sh),
                SizedBox(
                  height: 0.08.sh,
                  width: 0.18.sw,
                  child: ElevatedButton(
                    // button exit atau kembali ke halaman utama
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100),
                    onPressed: () {
                      context.goNamed('/');
                    },
                    child: Text("Exit",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                  ),
                ),
              ],
            ),
            Positioned(
              //leaderboard
              right: 60,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.25.sw,
                  height: 0.5.sh,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 30, 30, 30),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 250, 240, 175),
                                  size: 25.sp,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Leaderboard",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                        DefaultTabController(
                          // tab controller
                          length: 2,
                          child: SizedBox(
                            height: 0.37.sh,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Colors.black,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelStyle: TextStyle(fontSize: 14.sp),
                                  tabs: [
                                    Tab(
                                      text: 'Single Player',
                                    ),
                                    Tab(text: 'VS Player'),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TabBarView(
                                      children: [
                                        ScrollConfiguration(
                                          // scroll
                                          behavior:
                                              ScrollConfiguration.of(context)
                                                  .copyWith(
                                            dragDevices: {
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.mouse,
                                            },
                                          ),
                                          child:
                                              Consumer<LobbyChallengeProvider>(
                                            // leaderboard single player
                                            builder: (context, provider, _) {
                                              return ListView.separated(
                                                itemCount: provider
                                                    .challengeLeaderboard
                                                    .length,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                    height: 8,
                                                  );
                                                },
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height: 0.06.sh,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            provider
                                                                    .challengeLeaderboard[
                                                                        index]
                                                                    .rank
                                                                    ?.toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                fontSize: 20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                color: Colors
                                                                    .green
                                                                    .shade200),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${provider.challengeLeaderboard[index].player?.name}#${provider.challengeLeaderboard[index].player?.decorator}${(_userProvider.user.id == provider.challengeLeaderboard[index].playerId) ? " (me)" : ""}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16.sp),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .yellow
                                                                            .shade300,
                                                                        size: 18
                                                                            .sp,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                          provider.challengeLeaderboard[index].score?.toString() ??
                                                                              '',
                                                                          style:
                                                                              TextStyle(fontSize: 16.sp))
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
                                          // scroll
                                          behavior:
                                              ScrollConfiguration.of(context)
                                                  .copyWith(
                                            dragDevices: {
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.mouse,
                                            },
                                          ),
                                          child: Consumer<LobbyMatchProvider>(
                                            // leaderboard vs player
                                            builder: (context, provider, _) {
                                              return ListView.separated(
                                                itemCount: provider
                                                    .matchLeaderboard.length,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const SizedBox(
                                                    height: 8,
                                                  );
                                                },
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height: 0.06.sh,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            provider
                                                                    .matchLeaderboard[
                                                                        index]
                                                                    .rank
                                                                    ?.toString() ??
                                                                '',
                                                            style: TextStyle(
                                                                fontSize: 20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                color: Colors
                                                                    .green
                                                                    .shade200),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${provider.matchLeaderboard[index].player?.name}#${provider.matchLeaderboard[index].player?.decorator}${(_userProvider.user.id == provider.matchLeaderboard[index].playerId) ? " (me)" : ""}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16.sp),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .yellow
                                                                            .shade300,
                                                                        size: 18
                                                                            .sp,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                          provider.matchLeaderboard[index].rating?.toString() ??
                                                                              '',
                                                                          style:
                                                                              TextStyle(fontSize: 16.sp))
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
