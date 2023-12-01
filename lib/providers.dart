import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dice_client/model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:provider/provider.dart';

class LobbyConnProvider extends ChangeNotifier {
  WebSocketChannel? channelLobby;

  WebSocketChannel init(BuildContext context, Uri uri) {
    if (channelLobby == null) {
      channelLobby = WebSocketChannel.connect(uri);

      channelLobby!.stream.listen((event) {
        if (event != null) {
          DataEvent data = DataEvent.fromJson(jsonDecode(event));
          if (data.event == "on_join") {
            User user = User.fromJson(data.params);

            Provider.of<LobbyUserProvider>(context, listen: false)
                .addUser(user);
          } else if (data.event == "on_leave") {
            User user = User.fromJson(data.params);

            Provider.of<LobbyUserProvider>(context, listen: false)
                .removeUser(user);
          } else if (data.event == "new_match") {
            Match match = Match.fromJson(data.params);

            Provider.of<LobbyHistoryProvider>(context, listen: false)
                .addMatch(match);
          }
        }
      }).onDone(() {
        clear();
      });
    }

    return channelLobby!;
  }

  void clear() {
    channelLobby?.sink.close();
    channelLobby = null;
  }
}

class LobbyUserProvider extends ChangeNotifier {
  final List<User> _userList = [];
  bool isCalled = false;

  UnmodifiableListView<User> get items => UnmodifiableListView(_userList);

  void addUser(User user) {
    _userList.add(user);

    notifyListeners();
  }

  void removeUser(User user) {
    _userList.removeWhere((e) => e.id == user.id);

    notifyListeners();
  }

  void addUsers(List<User> users) {
    _userList.addAll(users);
    isCalled = true;

    notifyListeners();
  }

  void clear() {
    _userList.clear();
    isCalled = false;

    notifyListeners();
  }
}

class LobbyHistoryProvider extends ChangeNotifier {
  final List<Match> _matchList = [];
  bool isCalled = false;

  UnmodifiableListView<Match> get match => UnmodifiableListView(_matchList);

  void addMatch(Match match) {
    _matchList.insert(0, match);

    notifyListeners();
  }

  void removeMatch(Match match) {
    _matchList.removeWhere((e) => e.matchId == match.matchId);

    notifyListeners();
  }

  void addMatchs(List<Match> match) {
    _matchList.addAll(match.reversed.toList());
    isCalled = true;

    notifyListeners();
  }

  void clear() {
    _matchList.clear();
    isCalled = false;

    notifyListeners();
  }
}

class UserProvider extends ChangeNotifier {
  late User? _user;

  User get user => _user!;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clear() {
    _user = null;

    notifyListeners();
  }
}

class MatchProvider extends ChangeNotifier {
  Match? _match;
  bool isPlayer1 = false;

  Match get match => _match!;

  void setMatch(Match match) {
    _match = match;
    notifyListeners();
  }

  void setDices(Dices dices) {
    _match!.dices = dices;
    notifyListeners();
  }

  void setDicesValue({int? dice1, int? dice2}) {
    if (dice1 != null) _match!.dices.dice1 = dice1;
    if (dice2 != null) _match!.dices.dice2 = dice2;

    notifyListeners();
  }

  void clear() {
    _match = null;

    notifyListeners();
  }
}
