import 'dart:async';
import 'dart:convert';
import 'package:dice_client/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DiceModel with ChangeNotifier {
  int _dice1 = 6;
  int _dice2 = 6;
  int get dice1 => _dice1;
  int get dice2 => _dice2;

  void setDices(int d1, int d2) {
    _dice1 = d1;
    _dice2 = d2;
    notifyListeners();
  }

  void roll() {
    _dice1 = Random().nextInt(6) + 1;
    _dice2 = Random().nextInt(6) + 1;
    notifyListeners();
  }
}

class SinglePlayerPage extends StatefulWidget {
  const SinglePlayerPage({super.key});

  @override
  State<SinglePlayerPage> createState() => _SinglePlayerPageState();
}

class _SinglePlayerPageState extends State<SinglePlayerPage>
    with TickerProviderStateMixin {
  static const Duration _timerDuration = Duration(seconds: 10);
  final ValueNotifier<int> _count = ValueNotifier<int>(5);
  final ValueNotifier<int> _score = ValueNotifier<int>(0);
  final ValueNotifier<int?> _selectedOption = ValueNotifier<int?>(null);
  final ValueNotifier<bool> _hasSelectOption = ValueNotifier<bool>(false);
  final ValueNotifier<int> _round = ValueNotifier<int>(1);
  int _scoreD = 0;
  int _timeD = 0;
  final List<int> _scores = [];
  bool _hasResult = false;
  final ValueNotifier<bool> _timesup = ValueNotifier<bool>(false);
  final ValueNotifier<bool?> _result = ValueNotifier<bool?>(null);
  final ColorTween _colorTween =
      ColorTween(begin: Colors.red, end: Colors.green);
  late AnimationController _timerBarController;
  final DiceModel _diceModel = DiceModel();
  DataEvent? _dataEvent;
  final ValueNotifier<List<int>> _options = ValueNotifier<List<int>>([]);
  double rDx1 = 0;
  double rDx2 = 0;
  bool _rolling = false;

  late WebSocketChannel _channelArena;
  late ChallengeProvider _challengeProvider;
  late UserProvider _userProvider;

  Future<void> _rollDice() async {
    _rolling = true;
    while (!_hasResult) {
      _diceModel.roll();
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }

  Future<void> _countDown() async {
    _channelArena.sink.add(
      jsonEncode(
        DataEvent(
            event: "get_q",
            params: {"challenge_id": _challengeProvider.challenge.id}),
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 1; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      _count.value--;
    }
    _rollDice();

    await Future.delayed(const Duration(seconds: 1));
    _count.value--;

    await Future.delayed(const Duration(seconds: 2));
    _diceModel.setDices(
        _challengeProvider.question!.num1, _challengeProvider.question!.num2);

    _hasResult = true;
    _rolling = false;
    _options.value =
        (_challengeProvider.question!.wrong!..add(_challengeProvider.question!.answer!))
          ..shuffle();

    _challengeProvider.notify();
    _timerBarController.reverse();
  }

  void _showTimeoutDialog(Challenge challenge) {
    // dialog ketika waktu habis
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 0.3.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                      height: 0.15.sh,
                      image: AssetImage('assets/images/emoticon/amazing.png')),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  'Waktu Habis!',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 0.05.sh),
                Text(
                  'Skor ${challenge.score ?? 0}', // skor
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Teruslah berlatih dan jadilah bintang cerdas di dunia perhitungan!',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.05.sh),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100),
                    onPressed: () {
                      context.pop();
                      context.pop();
                    },
                    child: Text('Keluar',
                        style:
                            TextStyle(fontSize: 20.sp, color: Colors.white))),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEndDialog(Challenge challenge) {
    // dialog ketika permainan selesai
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 0.3.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                      height: 0.15.sh,
                      image: AssetImage('assets/images/emoticon/amazing.png')),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  'Permainan Selesai',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  'Skor ${challenge.score ?? 0}', // skor
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Teruslah berlatih dan jadilah bintang cerdas di dunia perhitungan!',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100),
                    onPressed: () {
                      context.pop();
                      context.pop();
                    },
                    child: Text('Keluar',
                        style:
                            TextStyle(fontSize: 20.sp, color: Colors.white))),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _timerWidget() {
    // timer widget
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
          valueListenable: _round,
          builder: (context, value, _) {
            return Text(
              "Round $value", // text round
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
            );
          },
        ),
        Flexible(
          // timer bar
          child: SizedBox(
            height: 0.06.sh,
            width: 0.5.sw,
            child: AnimatedBuilder(
              animation: _timerBarController,
              builder: (context, _) {
                var curDur = _timerDuration * _timerBarController.value;
                return Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: LinearProgressIndicator(
                        value: _timerBarController.value,
                        valueColor: _colorTween.animate(_timerBarController),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Text(
                            '${curDur.inSeconds}.${(curDur.inMilliseconds % 1000).toString().padLeft(3, "0")}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black12,
                            ),
                          ),
                          Text(
                            '${curDur.inSeconds}.${(curDur.inMilliseconds % 1000).toString().padLeft(3, "0")}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTRB(72, 0, 0, 0),
                    //     child: ValueListenableBuilder(
                    //       valueListenable: _result,
                    //       builder: (context, value, _) {
                    //         return AnimatedOpacity(
                    //           opacity: (value == null) ? 0 : 1,
                    //           duration: const Duration(milliseconds: 500),
                    //           child: Builder(
                    //             builder: (context) {
                    //               if (value == null) {
                    //                 return const SizedBox();
                    //               } else {
                    //                 if (value) {
                    //                   return Text('+$_timeD');
                    //                 } else {
                    //                   return Text('-$_timeD');
                    //                 }
                    //               }
                    //             },
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              },
            ),
          ),
        ),
        Stack(
          // skor dibawah timer
          clipBehavior: Clip.none,
          children: [
            ValueListenableBuilder(
              // total skor
              valueListenable: _score,
              builder: (context, value, _) {
                return Text(value.toString(),
                    style: TextStyle(fontSize: 20.sp));
              },
            ),
            Positioned(
              left: 64,
              child: ValueListenableBuilder(
                // skor yang ditambahkan
                valueListenable: _result,
                builder: (context, value, _) {
                  return AnimatedOpacity(
                    opacity: (value == null) ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    child: Builder(builder: (context) {
                      if (value == null) {
                        return const SizedBox();
                      } else {
                        return Text(
                          '+$_scoreD',
                          style: TextStyle(fontSize: 20.sp),
                        );
                      }
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _timerBarController =
        AnimationController(vsync: this, duration: _timerDuration, value: 1)
          ..addListener(
            () {
              if (_timerBarController.value <= 0.0) {
                _timesup.value = true;
                _timerBarController.stop();
                _dataEvent!.event = "end";
                _dataEvent!.params!["reason"] = "timeout";
                _channelArena.sink.add(jsonEncode(_dataEvent!.toJson()));
              }
            },
          );

    _challengeProvider = Provider.of<ChallengeProvider>(context, listen: false);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _channelArena = WebSocketChannel.connect(Uri.parse(
        "$WSENDPOINT/challenge?id=${_userProvider.user.id}&challenge_id=${_challengeProvider.challenge.id}"));

    _channelArena.stream.listen((event) {
      if (event != null) {
        _dataEvent = DataEvent.fromJson(jsonDecode(event));
        if (_dataEvent!.event == "connected") {
          _challengeProvider.setCur(
              rank: _dataEvent!.params!['cur_rank'],
              score: _dataEvent!.params!['cur_score']);
        } else if (_dataEvent!.event == "question") {
          _challengeProvider
              .setQuestion(Question.fromJson(_dataEvent!.params!['question']));
        } else if (_dataEvent!.event == "result") {
          _scoreD = _dataEvent!.params!["score"];
          _score.value += _scoreD;
          _scores.add(_scoreD);
          if (_scoreD > 0) {
            _result.value = true;
            _timeD = ((1 / (_timerDuration.inSeconds / 3)) *
                    _timerDuration.inSeconds)
                .round();
            _timerBarController.value += (1 / (_timerDuration.inSeconds / 3));
          } else {
            _result.value = false;
            _timeD =
                ((1 / (_timerDuration.inSeconds)) * _timerDuration.inSeconds)
                    .round();
            _timerBarController.value -= (1 / (_timerDuration.inSeconds));
          }

          Future.delayed(const Duration(seconds: 2), () {
            _challengeProvider.clearQuestion();
            _hasResult = false;
            _result.value = null;
            _options.value.clear();
            _selectedOption.value = null;
            _hasSelectOption.value = false;
            _count.value = 4;
            _round.value++;
            _countDown();
          });
        } else if (_dataEvent!.event == "end") {
          Challenge challenge =
              Challenge.fromJson(_dataEvent!.params!["challenge"]);
          _timerBarController.stop();
          if (_dataEvent!.params!["reason"] == "timeout") {
            _showTimeoutDialog(challenge);
          } else if (_dataEvent!.params!["reason"] == "exit") {
            _showEndDialog(challenge);
          }
          // showDialog(
          //   barrierDismissible: false,
          //   context: context,
          //   builder: (context) {
          //     return SizedBox(
          //       height: 500,
          //       width: 500,
          //       child: AlertDialog(
          //         title: const Text("Result"),
          //         content: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             ListTile(
          //               title: const Text("Score:"),
          //               subtitle: Text("${newChallenge.score}"),
          //             ),
          //             ListTile(
          //               title: const Text("Personal Best:"),
          //               subtitle: Text("${_challengeProvider.curScore}"),
          //             ),
          //             ListTile(
          //               title: const Text("Rank:"),
          //               subtitle: Text((newChallenge.rank != null && newChallenge.rank! < _challengeProvider.curRank)
          //                   ? '${_challengeProvider.curRank} -> ${newChallenge.rank}'
          //                   : '${_challengeProvider.curRank}'),
          //             ),
          //           ],
          //         ),
          //         actions: [
          //           ElevatedButton(
          //               onPressed: () {
          //                 context.pop();
          //                 context.pop();
          //               },
          //               child: const Text("Exit"))
          //         ],
          //       ),
          //     );
          //   },
          // );
        }
      }
    });
  }

  // arena permainan single player
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  'assets/images/background/background2.png'), // background
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.sp, 40.sp, 0, 0),
                  child: ElevatedButton(
                    // button home
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100,
                        padding: const EdgeInsets.all(0),
                        minimumSize: Size(0.06.sw, 0.12.sh),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp))),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                    onPressed: () {
                      showDialog(
                        // dialog meninggalkan permainan
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            content: SizedBox(
                              width: 0.3.sw,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.sp, 10.sp, 10.sp, 10.sp),
                                    child: Image(
                                        height: 0.15.sh,
                                        image: AssetImage(
                                            'assets/images/emoticon/suspicious.png')),
                                  ),
                                  SizedBox(
                                    height: 0.05.sh,
                                  ),
                                  Text(
                                    'Are you sure?',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(height: 0.05.sh),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.pink.shade100,
                                              minimumSize:
                                                  Size(0.09.sw, 0.09.sh)),
                                          onPressed: () {
                                            if (_dataEvent == null ||
                                                (_dataEvent?.event ?? false) ==
                                                    "connected") {
                                              context.pop();
                                              context.pop();
                                            } else {
                                              _timerBarController.stop();
                                              _dataEvent!.event = "end";
                                              _dataEvent!.params!["reason"] =
                                                  "exit";
                                              _channelArena.sink.add(jsonEncode(
                                                  _dataEvent!.toJson()));
                                              context.pop();
                                            }
                                          },
                                          child: Text('Yes',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white))),
                                      SizedBox(
                                        width: 0.05.sw,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blue.shade200,
                                              minimumSize:
                                                  Size(0.09.sw, 0.09.sh)),
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: Text('No',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: SizedBox(
                      child: _timerWidget(), // timer widget
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 0.2.sh,
                      width: 0.2.sw,
                      child: ListenableBuilder(
                        listenable: _diceModel,
                        builder: (context, _) {
                          double rDy = 0;
                          double turns = 0;
                          int duration = 500;
                          if (_rolling) {
                            rDy = Random().nextDouble() * -1.0;
                            if (rDx1 > 0) {
                              rDx1 = Random().nextDouble() * -1;
                            } else {
                              rDx1 = Random().nextDouble() * 1;
                            }
                            if (rDx1 < -0.8 || rDx1 > 0.8) {
                              if (rDx1 < -0.8) {
                                turns = (rDx1 * -5);
                              } else {
                                turns = -(rDx1 * 5);
                              }
                            } else if (rDx1 < 0) {
                              turns = (rDx1 * -3).clamp(1, 2);
                            } else {
                              turns = (-(rDx1 * 3)).clamp(-2.0, -1.0);
                            }
                          }
                          if (!_rolling) {
                            rDx1 = 0;
                            rDy = 0;
                            duration = 250;
                          }
                          return AnimatedSlide(
                            // dadu kiri
                            offset: Offset(rDx1, rDy),
                            duration: Duration(milliseconds: duration),
                            child: AnimatedRotation(
                              turns: turns,
                              duration: Duration(milliseconds: duration),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 150),
                                child: Image(
                                  key: ValueKey(Random().nextDouble()),
                                  image: AssetImage(
                                      'assets/images/dices/dice_${_diceModel.dice1}.png'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Consumer<ChallengeProvider>(
                      builder: (context, challenge, _) {
                        return SizedBox(
                          width: 150,
                          height: 180,
                          child: Builder(
                            builder: (context) {
                              if (challenge.question != null) {
                                return Center(
                                  child: Text(
                                    challenge.question!
                                        .op, // random operasi perhitungan
                                    style: TextStyle(
                                        fontSize: 70.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                );
                              } else {
                                return ValueListenableBuilder(
                                  valueListenable: _round,
                                  builder: (context, round, _) {
                                    return ValueListenableBuilder(
                                      valueListenable: _count,
                                      builder: (context, value, _) {
                                        Widget child = const SizedBox();

                                        if (value == 5) {
                                          return Center(
                                            child: SizedBox(
                                              width: 0.1.sw,
                                              height: 0.06.sh,
                                              child: ElevatedButton(
                                                // button start untuk memulai permainan
                                                onPressed: () {
                                                  _count
                                                      .value--; // hitung mundur 3 2 1
                                                  _countDown();
                                                },
                                                child: Text(
                                                  "Start",
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else if (value == -1) {
                                          child = const SizedBox();
                                        } else if (value == 4) {
                                          child = Text(
                                            "Ready",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          );
                                        } else if (value == 0) {
                                          child = Text(
                                            "ROLL",
                                            style: TextStyle(
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          );
                                        } else {
                                          child = Text(
                                            value.toString(),
                                            style: TextStyle(
                                                fontSize: 28.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          );
                                        }

                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            (value <= 0)
                                                ? const SizedBox()
                                                : Text(
                                                    "Round $round",
                                                    style: TextStyle(
                                                        fontSize: 28.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                            SizedBox(
                                              height: 0.01.sh,
                                            ),
                                            AnimatedSwitcher(
                                              duration:
                                                  (value == 0 || value == 4)
                                                      ? const Duration(
                                                          milliseconds: 0)
                                                      : const Duration(
                                                          milliseconds: 250),
                                              transitionBuilder:
                                                  (child, animation) {
                                                return ScaleTransition(
                                                  scale: animation,
                                                  child: child,
                                                );
                                              },
                                              child: Center(
                                                key: ValueKey<int>(value),
                                                child: child,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 0.2.sh,
                      width: 0.2.sw,
                      child: ListenableBuilder(
                        listenable: _diceModel,
                        builder: (context, _) {
                          double rDy = 0;
                          double turns = 0;
                          int duration = 500;
                          if (_rolling) {
                            rDy = Random().nextDouble() * -1.0;
                            if (rDx2 > 0) {
                              rDx2 = Random().nextDouble() * -1;
                            } else {
                              rDx2 = Random().nextDouble() * 1;
                            }
                            if (rDx2 < -0.8 || rDx2 > 0.8) {
                              if (rDx2 < -0.8) {
                                turns = (rDx2 * -5);
                              } else {
                                turns = -(rDx2 * 5);
                              }
                            } else if (rDx2 < 0) {
                              turns = (rDx2 * -3).clamp(1, 2);
                            } else {
                              turns = (-(rDx2 * 3)).clamp(-2.0, -1.0);
                            }
                          }
                          if (!_rolling) {
                            rDx2 = 0;
                            rDy = 0;
                            duration = 250;
                          }
                          return AnimatedSlide(
                            // dadu kanan
                            offset: Offset(rDx2, rDy),
                            duration: Duration(milliseconds: duration),
                            child: AnimatedRotation(
                              turns: turns,
                              duration: Duration(milliseconds: duration),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 150),
                                child: Image.asset(
                                  'assets/images/dices/dice_${_diceModel.dice2}.png',
                                  key: ValueKey(Random().nextDouble()),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                // pemberitahuan jawaban benar atau salah
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 180.sp),
                  child: ValueListenableBuilder(
                    valueListenable: _result,
                    builder: (context, value, _) {
                      if (value == null) {
                        return const SizedBox();
                      } else {
                        String text = '';
                        if (value) {
                          text = "Correct Answer";
                        } else {
                          text = "Wrong Answer";
                        }

                        return Text(
                          text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        );
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 160.sp),
                  child: ValueListenableBuilder(
                    valueListenable: _hasSelectOption,
                    builder: (context, value, _) {
                      if (value) {
                        return const SizedBox();
                      }
                      return ValueListenableBuilder(
                        valueListenable: _options,
                        builder: (context, options, _) {
                          if (options.isEmpty) {
                            return const SizedBox();
                          } else {
                            return Text(
                              'Choose the correct answer below',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                // pilihan jawaban
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 90.sp),
                  child: SizedBox(
                    height: 0.1.sh,
                    child: ValueListenableBuilder(
                      valueListenable: _result,
                      builder: (context, result, _) {
                        return ValueListenableBuilder(
                          valueListenable: _options,
                          builder: (context, options, _) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: options.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 80,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Consumer<ChallengeProvider>(
                                  builder: (context, challenge, _) {
                                    return ValueListenableBuilder(
                                      valueListenable: _selectedOption,
                                      builder: (context, value, _) {
                                        return SizedBox(
                                          width: 120,
                                          child: AnimatedOpacity(
                                            opacity: ((value == null ||
                                                        value == index) ||
                                                    (result != null &&
                                                        (result == false &&
                                                            options[index] ==
                                                                challenge
                                                                    .question!
                                                                    .answer!)))
                                                ? 1
                                                : 0,
                                            duration: const Duration(
                                                milliseconds: 250),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20))),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith(
                                                  (states) {
                                                    bool isCorrect =
                                                        (options[index] ==
                                                            challenge.question!
                                                                .answer!);

                                                    if (states.contains(
                                                        MaterialState
                                                            .disabled)) {
                                                      if (result == null) {
                                                        return Colors.orange;
                                                      } else if (isCorrect) {
                                                        return Colors.green;
                                                      } else {
                                                        return Colors.red;
                                                      }
                                                    } else {
                                                      return Colors.blue;
                                                    }
                                                  },
                                                ),
                                              ),
                                              onPressed: (value != null)
                                                  ? null
                                                  : () {
                                                      _hasSelectOption.value =
                                                          true;
                                                      _selectedOption.value =
                                                          index;
                                                      _timerBarController
                                                          .stop();
                                                      _dataEvent!.event =
                                                          "answer";
                                                      _dataEvent!.params![
                                                              "answer"] =
                                                          options[index];
                                                      _dataEvent!.params![
                                                              'remaining_seconds'] =
                                                          _timerBarController
                                                                  .value *
                                                              _timerDuration
                                                                  .inSeconds;
                                                      _channelArena.sink.add(
                                                          jsonEncode(_dataEvent!
                                                              .toJson()));
                                                    },
                                              child: Text(
                                                  options[index].toString(),
                                                  style: TextStyle(
                                                      fontSize: 28.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
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
    );
  }

  @override
  void dispose() {
    _channelArena.sink.close();
    _timerBarController.dispose();
    _challengeProvider.onDispose();
    super.dispose();
  }
}
