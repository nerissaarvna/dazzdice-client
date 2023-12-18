// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      decorator: json['decorator'] as int,
      matchLeaderboard: json['matchLeaderboard'] == null
          ? null
          : MatchLeaderboard.fromJson(
              json['matchLeaderboard'] as Map<String, dynamic>),
      challengeLeaderboard: json['challengeLeaderboard'] == null
          ? null
          : ChallengeLeaderboard.fromJson(
              json['challengeLeaderboard'] as Map<String, dynamic>),
      matchs: (json['matchs'] as List<dynamic>?)
          ?.map((e) => Match.fromJson(e as Map<String, dynamic>))
          .toList(),
      challenges: (json['challenges'] as List<dynamic>?)
          ?.map((e) => Challenge.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'decorator': instance.decorator,
      'matchLeaderboard': instance.matchLeaderboard,
      'challengeLeaderboard': instance.challengeLeaderboard,
      'matchs': instance.matchs,
      'challenges': instance.challenges,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$DataEventImpl _$$DataEventImplFromJson(Map<String, dynamic> json) =>
    _$DataEventImpl(
      event: json['event'] as String,
      sender: json['sender'] as String?,
      params: json['params'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DataEventImplToJson(_$DataEventImpl instance) =>
    <String, dynamic>{
      'event': instance.event,
      'sender': instance.sender,
      'params': instance.params,
    };

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      player1Id: json['player1Id'] as String,
      player2Id: json['player2Id'] as String,
      player1: json['player1'] == null
          ? null
          : User.fromJson(json['player1'] as Map<String, dynamic>),
      player2: json['player2'] == null
          ? null
          : User.fromJson(json['player2'] as Map<String, dynamic>),
      round: json['round'] as int?,
      winner: json['winner'] as int?,
      question: (json['question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      player1Status: json['player1Status'] as String?,
      player2Status: json['player2Status'] as String?,
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player1Id': instance.player1Id,
      'player2Id': instance.player2Id,
      'player1': instance.player1,
      'player2': instance.player2,
      'round': instance.round,
      'winner': instance.winner,
      'question': instance.question,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'player1Status': instance.player1Status,
      'player2Status': instance.player2Status,
    };

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeImpl(
      id: json['id'] as String,
      playerId: json['playerId'] as String,
      player: json['player'] == null
          ? null
          : User.fromJson(json['player'] as Map<String, dynamic>),
      round: json['round'] as int?,
      score: json['score'] as int?,
      rank: json['rank'] as int?,
      question: (json['question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playerId': instance.playerId,
      'player': instance.player,
      'round': instance.round,
      'score': instance.score,
      'rank': instance.rank,
      'question': instance.question,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$ChallengeLeaderboardImpl _$$ChallengeLeaderboardImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeLeaderboardImpl(
      playerId: json['playerId'] as String,
      challengeId: json['challengeId'] as String,
      player: json['player'] == null
          ? null
          : User.fromJson(json['player'] as Map<String, dynamic>),
      round: json['round'] as int?,
      score: json['score'] as int?,
      rank: json['rank'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChallengeLeaderboardImplToJson(
        _$ChallengeLeaderboardImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'challengeId': instance.challengeId,
      'player': instance.player,
      'round': instance.round,
      'score': instance.score,
      'rank': instance.rank,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$MatchLeaderboardImpl _$$MatchLeaderboardImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchLeaderboardImpl(
      playerId: json['playerId'] as String,
      player: json['player'] == null
          ? null
          : User.fromJson(json['player'] as Map<String, dynamic>),
      rating: json['rating'] as int?,
      rank: json['rank'] as int?,
      wins: json['wins'] as int?,
      loses: json['loses'] as int?,
      draws: json['draws'] as int?,
      plays: json['plays'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MatchLeaderboardImplToJson(
        _$MatchLeaderboardImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'player': instance.player,
      'rating': instance.rating,
      'rank': instance.rank,
      'wins': instance.wins,
      'loses': instance.loses,
      'draws': instance.draws,
      'plays': instance.plays,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as int,
      challengeId: json['challengeId'] as String?,
      matchId: json['matchId'] as String?,
      difficulty: json['difficulty'] as int,
      num1: json['num1'] as int,
      op: json['op'] as String,
      num2: json['num2'] as int,
      answer: json['answer'] as int?,
      score: json['score'] as int?,
      score2: json['score2'] as int?,
      wrong: (json['wrong'] as List<dynamic>?)?.map((e) => e as int).toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challengeId': instance.challengeId,
      'matchId': instance.matchId,
      'difficulty': instance.difficulty,
      'num1': instance.num1,
      'op': instance.op,
      'num2': instance.num2,
      'answer': instance.answer,
      'score': instance.score,
      'score2': instance.score2,
      'wrong': instance.wrong,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
