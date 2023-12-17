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
                                  color: Color.fromARGB(255, 165, 214, 167),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Online",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
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
                        "1 Player",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.pushNamed("duaplayer");
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100,
                          fixedSize: Size(150, 40)),
                      child: const Text(
                        "2 Player",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )),
                  SizedBox(
                    height: 20,
                  ),
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
                    color: Colors.white,
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
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                        DefaultTabController(
                          length: 2,
                          child: Container(
                            height: 260,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TabBar(
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.grey,
                                    indicatorColor: Colors.black,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    tabs: [
                                      Tab(text: '1 Player'),
                                      Tab(text: '2 Player'),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '1',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      height: 40,
                                                      width: 290,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: Colors
                                                              .green.shade200),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 0, 10, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'nerissa (you)',
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .yellow
                                                                      .shade300,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text('1000',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '1',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      height: 40,
                                                      width: 290,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: Colors
                                                              .green.shade200),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 0, 10, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'nerissa (you)',
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .yellow
                                                                      .shade300,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text('1000',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        // Flexible(
                        //   child: ScrollConfiguration(
                        //     behavior: ScrollConfiguration.of(context).copyWith(
                        //       dragDevices: {
                        //         PointerDeviceKind.touch,
                        //         PointerDeviceKind.mouse,
                        //       },
                        //     ),
                        //     child: Consumer<LobbyHistoryProvider>(
                        //       builder: (context, history, _) =>
                        //           ListView.builder(
                        //         itemCount: 1,
                        //         itemBuilder: (context, index) {
                        //           return Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 padding:
                        //                     EdgeInsets.fromLTRB(20, 5, 20, 0),
                        //                 child: Row(
                        //                   children: [
                        //                     Text(
                        //                       '1',
                        //                       style: TextStyle(fontSize: 24),
                        //                     ),
                        //                     SizedBox(
                        //                       width: 20,
                        //                     ),
                        //                     Text('nerissa (you)',
                        //                         style: TextStyle(fontSize: 22)),
                        //                     SizedBox(
                        //                       width: 70,
                        //                     ),
                        //                     Icon(
                        //                       Icons.star_rounded,
                        //                       size: 22,
                        //                     ),
                        //                     Text('0',
                        //                         style: TextStyle(fontSize: 22)),
                        //                   ],
                        //                 ),
                        //               )
                        //             ],
                        //           );
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // )
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
