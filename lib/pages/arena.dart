import 'dart:convert';
import 'package:dice_client/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ArenaPage extends StatefulWidget {
  const ArenaPage({super.key});

  @override
  State<ArenaPage> createState() => _ArenaPageState();
}

class _ArenaPageState extends State<ArenaPage> {
  final String _address = 'localhost';
  final String _port = "3000";
  bool _hasResult = false;
  final ValueNotifier<int> _count = ValueNotifier<int>(3);
  final ValueNotifier<int> _dice1 = ValueNotifier<int>(6);
  final ValueNotifier<int> _dice2 = ValueNotifier<int>(6);

  late WebSocketChannel _channelArena;

  Future<void> _rollDice() async {
    while (!_hasResult) {
      await Future.delayed(
          Duration(milliseconds: 50 + Random().nextInt(250 - 50)), () {
        _dice1.value = Random().nextInt(6) + 1;
        _dice2.value = Random().nextInt(6) + 1;
      });
    }
  }

  Future<void> _countDown() async {
    _channelArena.sink.add(jsonEncode({
      "event": "ready",
      "params": {
        "match_id":
            Provider.of<MatchProvider>(context, listen: false).match.matchId,
        "id": Provider.of<UserProvider>(context, listen: false).user.id,
      }
    }));

    for (int i = 1; i < 4; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        _count.value--;
      });
    }
  }

  Future<void> _match() async {
    await _countDown();
    _rollDice();
  }

  Widget _cardInfo(User user) {
    return SizedBox(
      width: 150.w,
      height: 250.h,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.blueAccent,
        shadowColor: (Provider.of<UserProvider>(context).user.id == user.id)
            ? Colors.white
            : null,
        elevation: 16,
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "W: ${user.history?.win}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "D: ${user.history?.draw}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "L: ${user.history?.lose}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _endWidget(String text) {
    return Center(
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 48, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          ElevatedButton(
              onPressed: () {
                context.pushReplacementNamed("lobby");
              },
              child: const Text("Back"))
        ],
      ),
    );
  }

  @override
  void initState() {
    _channelArena = WebSocketChannel.connect(Uri.parse(
        "ws://$_address:$_port/arena?id=${Provider.of<UserProvider>(context, listen: false).user.id}&match_id=${Provider.of<MatchProvider>(context, listen: false).match.matchId}"));

    _channelArena.stream.listen((event) {
      if (event != null) {
        DataEvent data = DataEvent.fromJson(jsonDecode(event));
        if (data.event == "result") {
          _hasResult = true;
          Match match = Match.fromJson(data.params);
          Provider.of<MatchProvider>(context, listen: false).setMatch(match);
        }
      }
    });
    _match();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _cardInfo(Provider.of<MatchProvider>(context, listen: false)
                  .match
                  .players
                  .player1
                  .player),
              _cardInfo(Provider.of<MatchProvider>(context, listen: false)
                  .match
                  .players
                  .player2
                  .player),
            ],
          ),
          Consumer<MatchProvider>(builder: (context, match, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: (match.match.dices.dice1 != 0)
                      ? Consumer<MatchProvider>(
                          builder: (context, match, _) {
                            return Image(
                              image: AssetImage(
                                  'assets/images/dices/dice_${match.match.dices.dice1.toString()}.png'),
                            );
                          },
                        )
                      : ValueListenableBuilder(
                          valueListenable: _dice1,
                          builder: (context, value, _) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/dices/dice_0.png'),
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/dices/dice_$value.png'),
                                )
                              ],
                            );
                          },
                        ),
                ),
                ValueListenableBuilder(
                  valueListenable: _count,
                  builder: (context, value, _) {
                    return SizedBox(
                      width: 0.25.sw,
                      height: 0.25.sh,
                      child: Builder(builder: (context) {
                        if (_hasResult) {
                          if (Provider.of<UserProvider>(context).user.id ==
                                  match.match.players.player1.player.id &&
                              match.match.winner == 1) {
                            return _endWidget("You Win");
                          } else if (Provider.of<UserProvider>(context)
                                      .user
                                      .id ==
                                  match.match.players.player2.player.id &&
                              match.match.winner == 2) {
                            return _endWidget("You Win");
                          } else if (Provider.of<UserProvider>(context)
                                      .user
                                      .id ==
                                  match.match.players.player1.player.id &&
                              match.match.winner == 2) {
                            return _endWidget("You Lose");
                          } else if (Provider.of<UserProvider>(context)
                                      .user
                                      .id ==
                                  match.match.players.player2.player.id &&
                              match.match.winner == 1) {
                            return _endWidget("You Lose");
                          } else {
                            return _endWidget("DRAW");
                          }
                        } else {
                          if (value != 0) {
                            return Center(
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }
                      }),
                    );
                  },
                ),
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: (match.match.dices.dice2 != 0)
                      ? Consumer<MatchProvider>(
                          builder: (context, match, _) {
                            return Image(
                              image: AssetImage(
                                  'assets/images/dices/dice_${match.match.dices.dice2.toString()}.png'),
                            );
                          },
                        )
                      : ValueListenableBuilder(
                          valueListenable: _dice2,
                          builder: (context, value, _) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/dices/dice_0.png'),
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/dices/dice_$value.png'),
                                )
                              ],
                            );
                          },
                        ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channelArena.sink.close();
    Provider.of<MatchProvider>(context, listen: false).clear();
    super.dispose();
  }
}
