import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import 'dart:async';

class DuaplayerPage extends StatefulWidget {
  const DuaplayerPage({super.key});

  @override
  State<DuaplayerPage> createState() => _DuaplayerPageState();
}

class _DuaplayerPageState extends State<DuaplayerPage> {
  final ValueNotifier<double> _timer = ValueNotifier<double>(1);
  final ValueNotifier<int> _count = ValueNotifier<int>(3);

  _countDown() async {
    for (int i = 1; i < 4; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        _count.value--;
      });
      print(_count.value);
    }
    _timerDown();
  }

  _timerDown() async {
    while (_timer.value > 0) {
      await Future.delayed(Duration(seconds: 1));
      _timer.value = _timer.value - 1 / 30;
    }
    //_showTimerFinishedDialogWin();
    _showTimerFinishedDialogLose();
  }

  void _showTimerFinishedDialogWin() {
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
            content: Container(
              width: 500,
              height: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Image(
                        width: 100,
                        image: AssetImage('assets/images/emoticon/love.png')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Kamu adalah pemenang sejati dalam permainan perhitungan ini! Keterampilan matematika dan kecerdasanmu sungguh luar biasa.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100,
                          fixedSize: Size(100, 40)),
                      onPressed: () {
                        context.pushNamed("lobby");
                      },
                      child: Text('OK',
                          style: TextStyle(fontSize: 22, color: Colors.white))),
                ],
              ),
            ),
          );
        });
  }

  void _showTimerFinishedDialogLose() {
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
            content: Container(
              width: 500,
              height: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Image(
                        width: 100,
                        image:
                            AssetImage('assets/images/emoticon/concern.png')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Don't give up!",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tidak masalah, jangan kecewa. Besok adalah kesempatan baru untuk meraih kemenangan!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade100,
                          fixedSize: Size(100, 40)),
                      onPressed: () {
                        context.pushNamed("lobby");
                      },
                      child: Text('OK',
                          style: TextStyle(fontSize: 22, color: Colors.white))),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    _countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background/background2.png'),
          )),
          child: Stack(
            children: [
              ValueListenableBuilder(
                  valueListenable: _count,
                  builder: (context, value, _) {
                    if (value > 0) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            value.toString(),
                            style: TextStyle(
                                fontSize: 56, fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink.shade100,
                        padding: EdgeInsets.all(0),
                        fixedSize: Size(65, 65),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color.fromARGB(255, 30, 30, 30),
                              content: Container(
                                width: 350,
                                height: 200,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      child: Image(
                                          width: 50,
                                          image: AssetImage(
                                              'assets/images/emoticon/suspicious.png')),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Are you sure?',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.pink.shade100,
                                                fixedSize: Size(100, 40)),
                                            onPressed: () {
                                              context.pop();
                                              context.pop();
                                            },
                                            child: Text('Yes',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue.shade200,
                                                fixedSize: Size(100, 40)),
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: Text('No',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white)))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: SizedBox(
                    height: 24,
                    width: 360,
                    child: ValueListenableBuilder(
                      valueListenable: _timer,
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          backgroundColor: Colors.white,
                          value: value,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'player 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 30, 30, 30),
                                fontSize: 28),
                          ),
                        )),
                    Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('nerissa (you)',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(225, 250, 225, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Image(
                          image: AssetImage('assets/images/dices/dice_1.png')),
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Image(
                            image:
                                AssetImage('assets/images/operasi/Plus.png'))),
                    Container(
                        height: 150,
                        width: 150,
                        child: Image(
                            image:
                                AssetImage('assets/images/dices/dice_1.png')))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Choose the correct answer below',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(400, 470, 400, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green.shade200,
                                  minimumSize: Size(100, 100),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green.shade200,
                                  minimumSize: Size(100, 100),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green.shade200,
                                  minimumSize: Size(100, 100),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
