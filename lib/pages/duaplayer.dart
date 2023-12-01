import "package:flutter/material.dart";
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
                        child: Text(
                          value.toString(),
                          style: TextStyle(fontSize: 56),
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
                                              'assets/images/emoticon/face-neutral.png')),
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
                                            onPressed: () {},
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
                                            onPressed: () {},
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
                          backgroundColor: Colors.red,
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
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'leejeno23',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 30, 30, 30),
                                fontSize: 28),
                          ),
                        )),
                    Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('You',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(300, 250, 300, 0),
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
                padding: const EdgeInsets.fromLTRB(400, 0, 400, 80),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.shade200,
                        ),
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '7',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink.shade100,
                        ),
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '10',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow.shade200,
                        ),
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

class CustomProgressBar extends StatelessWidget {
  final double width;
  final double value;
  final double totalValue;

  CustomProgressBar(this.width, this.value, this.totalValue);
  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.timer,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5)),
            ),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                height: 10,
                width: width * ratio,
                duration: Duration(seconds: 30),
                decoration: BoxDecoration(
                    color: (ratio < 0.3)
                        ? Colors.red.shade500
                        : (ratio < 0.6)
                            ? Colors.yellow.shade700
                            : Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TimeState with ChangeNotifier {
  int _time = 15;
  int get time => _time;
  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
