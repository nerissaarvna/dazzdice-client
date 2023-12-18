// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';

part 'model.g.dart';

@unfreezed
class User with _$User {
  factory User({
    required final String id,
    required String name,
    required int decorator,
    MatchLeaderboard? matchLeaderboard,
    ChallengeLeaderboard? challengeLeaderboard,
    List<Match>? matchs,
    List<Challenge>? challenges,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@unfreezed
class DataEvent with _$DataEvent {
  factory DataEvent({
    required String event,
    String? sender,
    Map<String, dynamic>? params,
  }) = _DataEvent;

  factory DataEvent.fromJson(Map<String, dynamic> json) => _$DataEventFromJson(json);
}

@unfreezed
class Match with _$Match {
  factory Match({
    required final String id,
    required String player1Id,
    required String player2Id,
    User? player1,
    User? player2,
    int? round,
    int? winner,
    List<Question>? question,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? player1Status,
    String? player2Status,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}

@unfreezed
class Challenge with _$Challenge {
  factory Challenge({
    required final String id,
    required final String playerId,
    User? player,
    int? round,
    int? score,
    int? rank,
    List<Question>? question,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) => _$ChallengeFromJson(json);
}

@unfreezed
class ChallengeLeaderboard with _$ChallengeLeaderboard {
  factory ChallengeLeaderboard({
    required final String playerId,
    required String challengeId,
    User? player,
    int? round,
    int? score,
    int? rank,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ChallengeLeaderboard;

  factory ChallengeLeaderboard.fromJson(Map<String, dynamic> json) => _$ChallengeLeaderboardFromJson(json);
}

@unfreezed
class MatchLeaderboard with _$MatchLeaderboard {
  factory MatchLeaderboard({
    required final String playerId,
    User? player,
    int? rating,
    int? rank,
    int? wins,
    int? loses,
    int? draws,
    int? plays,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MatchLeaderboard;

  factory MatchLeaderboard.fromJson(Map<String, dynamic> json) => _$MatchLeaderboardFromJson(json);
}

@unfreezed
class Question with _$Question {
  factory Question({
    required final int id,
    String? challengeId,
    String? matchId,
    required int difficulty,
    required int num1,
    required String op,
    required int num2,
    int? answer,
    int? score,
    int? score2,
    List<int>? wrong,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
