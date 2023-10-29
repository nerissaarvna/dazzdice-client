import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:dice_client/model.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArenaPage extends StatefulWidget {
  const ArenaPage(
      {super.key,
      required this.id,
      required this.matchId,
      required this.player});

  final String id;
  final String matchId;
  final int player;

  @override
  State<ArenaPage> createState() => _ArenaPageState();
}

class _ArenaPageState extends State<ArenaPage> {
  final String _address = 'localhost';
  final String _port = "3000";
  bool _hasResult = false;

  late WebSocketChannel _channelArena;

  final ValueNotifier<int> _dice1 = ValueNotifier<int>(6);
  final ValueNotifier<int> _dice2 = ValueNotifier<int>(6);
  final ValueNotifier<int> _count = ValueNotifier<int>(3);

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
    if (widget.player == 1) {
      _channelArena.sink.add(jsonEncode({
        "event": "player1_ready",
        "params": {"match_id": widget.matchId}
      }));
    } else if (widget.player == 2) {
      _channelArena.sink.add(jsonEncode({
        "event": "player2_ready",
        "params": {"match_id": widget.matchId}
      }));
    }
    for (int i = 1; i < 4; i++) {
      await Future.delayed(Duration(seconds: 1), () {
        _count.value--;
      });
    }
  }

  Future<void> _match() async {
    await _countDown();
    _rollDice();
  }

  @override
  void initState() {
    _channelArena = WebSocketChannel.connect(Uri.parse(
        "ws://$_address:$_port/arena/${widget.id}/${widget.matchId}"));

    _channelArena.stream.listen((event) {
      if (event != null) {
        Map<String, dynamic> data = jsonDecode(event);
        if (data["event"] == "result") {
          print(data["params"]);
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
              Container(
                child: Text("Player 1"),
              ),
              Container(
                child: Text("Player 2"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ValueListenableBuilder(
                valueListenable: _dice1,
                builder: (context, value, _) {
                  return Text(value.toString());
                },
              ),
              ValueListenableBuilder(
                valueListenable: _count,
                builder: (context, value, _) {
                  return SizedBox(
                    width: 0.25.sw,
                    child: (value != 0)
                        ? Center(
                            child: Text(value.toString()),
                          )
                        : null,
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _dice2,
                builder: (context, value, _) {
                  return Text(value.toString());
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _rollDice();
            },
            child: Text("ROLL"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channelArena.sink.close();
    super.dispose();
  }
}
