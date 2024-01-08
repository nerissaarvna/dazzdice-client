import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dice_client/model.dart';

const ENDPOINT = String.fromEnvironment('ENDPOINT');
const ENDPOINT2 = String.fromEnvironment('ENDPOINT2');
String HTTPENDPOINT = "https://$ENDPOINT";
String WSENDPOINT = "wss://$ENDPOINT";

class LobbyUserProvider extends ChangeNotifier {
  final List<User> _userList = [];
  bool isCalled = false;

  UnmodifiableListView<User> get items => UnmodifiableListView(_userList);

  void addUser(User user) {
    _userList.add(user);

    notifyListeners();
  }

  void removeUser(String id) {
    _userList.removeWhere((e) => e.id == id);

    notifyListeners();
  }

  void addUsers(List<User> users) {
    _userList.addAll(users);
    isCalled = true;

    notifyListeners();
  }

  void clear() {
    onDispose();
    notifyListeners();
  }

  void onDispose() {
    _userList.clear();
    isCalled = false;
  }
}

class LobbyMatchProvider extends ChangeNotifier {
  final List<MatchLeaderboard> _matchList = [];
  bool isCalled = false;

  UnmodifiableListView<MatchLeaderboard> get matchLeaderboard =>
      UnmodifiableListView(_matchList);

  void addMatch(MatchLeaderboard match) {
    _matchList.insert(0, match);

    notifyListeners();
  }

  void addMatchs(List<MatchLeaderboard> matchs) {
    _matchList.addAll(matchs);
    isCalled = true;

    notifyListeners();
  }

  void clear() {
    onDispose();
    notifyListeners();
  }

  void onDispose() {
    _matchList.clear();
    isCalled = false;
  }
}

class LobbyChallengeProvider extends ChangeNotifier {
  List<ChallengeLeaderboard> _challengeList = [];
  bool isCalled = false;

  UnmodifiableListView<ChallengeLeaderboard> get challengeLeaderboard =>
      UnmodifiableListView(_challengeList);

  void addChallenges(List<ChallengeLeaderboard> challenges) {
    _challengeList = challenges;
    isCalled = true;

    notifyListeners();
  }

  void setChallenge(ChallengeLeaderboard challenge) {
    _challengeList[_challengeList.indexWhere(
        (element) => element.playerId == challenge.playerId)] = challenge;

    notifyListeners();
  }

  void clear() {
    onDispose();
    notifyListeners();
  }

  void onDispose() {
    _challengeList.clear();
    isCalled = false;
  }
}

class UserProvider extends ChangeNotifier {
  User? _user;

  User get user => _user!;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clear() {
    onDispose();
    notifyListeners();
  }

  void onDispose() {
    _user = null;
  }
}

class MatchProvider extends ChangeNotifier {
  Match? _match;
  Question? _question;
  int dice1 = 6;
  int dice2 = 6;
  int curRank = 0;
  int curScore = 0;

  Question? get question => _question;

  Match get match => _match!;

  setMatch(Match match) {
    _match = match;
    notifyListeners();
  }

  setQuestion(Question question) {
    _question = question;

    dice1 = question.num1;
    dice2 = question.num2;
    // notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  void clearQuestion() {
    _question = null;
    notifyListeners();
  }

  void roll() {
    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
    notifyListeners();
  }

  void clear() {
    onDispose();
    notifyListeners();
  }

  void onDispose() {
    _match = null;
  }
}

class ChallengeProvider extends ChangeNotifier {
  late Challenge _challenge;
  Question? _question;
  int dice1 = 6;
  int dice2 = 6;
  int curRank = 0;
  int curScore = 0;

  Challenge get challenge => _challenge;
  Question? get question => _question;

  setChallenge(Challenge challenge) async {
    _challenge = challenge;
    notifyListeners();
  }

  setQuestion(Question question) async {
    _question = question;

    dice1 = question.num1;
    dice2 = question.num2;
  }

  void notify() {
    notifyListeners();
  }

  void clearQuestion() {
    _question = null;
    notifyListeners();
  }

  void roll() {
    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
    notifyListeners();
  }

  void setCur({required int rank, required int score}) {
    curRank = rank;
    curScore = score;
    notifyListeners();
  }

  void clear() {
    onDispose();
    notifyListeners();
  }

  void onDispose() {
    _question = null;
  }
}
