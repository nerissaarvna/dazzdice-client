import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:dice_client/model.dart';
import 'package:provider/provider.dart';

class LobbyUserProvider extends ChangeNotifier {
  final List<User> _userList = [];

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

    notifyListeners();
  }
}

class MatchProvider extends ChangeNotifier {
  late String matchId;
  late String player1;
  late String player2;
  late int dice1;
  late int dice2;
  late String status;
  late int winner;
}
