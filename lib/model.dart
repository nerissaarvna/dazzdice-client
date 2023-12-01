// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';

part 'model.g.dart';

@freezed
class History with _$History {
  const factory History({
    required int win,
    required int lose,
    required int draw,
    required int plays,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    History? history,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@unfreezed
class DataEvent with _$DataEvent {
  factory DataEvent({
    required String event,
    required Map<String, dynamic> params,
  }) = _DataEvent;

  factory DataEvent.fromJson(Map<String, dynamic> json) =>
      _$DataEventFromJson(json);
}

@freezed
class Player with _$Player {
  const factory Player({
    required User player,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@freezed
class Players with _$Players {
  const factory Players({
    required Player player1,
    required Player player2,
  }) = _Players;

  factory Players.fromJson(Map<String, dynamic> json) =>
      _$PlayersFromJson(json);
}

@unfreezed
class Dices with _$Dices {
  factory Dices({
    required int dice1,
    required int dice2,
  }) = _Dices;

  factory Dices.fromJson(Map<String, dynamic> json) => _$DicesFromJson(json);
}

@unfreezed
class Match with _$Match {
  factory Match({
    @JsonKey(name: "match_id") required final String matchId,
    required final DateTime datetime,
    required final Players players,
    required Dices dices,
    required int? winner,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}
