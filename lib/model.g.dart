// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryImpl _$$HistoryImplFromJson(Map<String, dynamic> json) =>
    _$HistoryImpl(
      win: json['win'] as int,
      lose: json['lose'] as int,
      draw: json['draw'] as int,
      plays: json['plays'] as int,
    );

Map<String, dynamic> _$$HistoryImplToJson(_$HistoryImpl instance) =>
    <String, dynamic>{
      'win': instance.win,
      'lose': instance.lose,
      'draw': instance.draw,
      'plays': instance.plays,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      history: json['history'] == null
          ? null
          : History.fromJson(json['history'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'history': instance.history,
    };

_$DataEventImpl _$$DataEventImplFromJson(Map<String, dynamic> json) =>
    _$DataEventImpl(
      event: json['event'] as String,
      params: json['params'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$DataEventImplToJson(_$DataEventImpl instance) =>
    <String, dynamic>{
      'event': instance.event,
      'params': instance.params,
    };

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      player: User.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

_$PlayersImpl _$$PlayersImplFromJson(Map<String, dynamic> json) =>
    _$PlayersImpl(
      player1: Player.fromJson(json['player1'] as Map<String, dynamic>),
      player2: Player.fromJson(json['player2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayersImplToJson(_$PlayersImpl instance) =>
    <String, dynamic>{
      'player1': instance.player1,
      'player2': instance.player2,
    };

_$DicesImpl _$$DicesImplFromJson(Map<String, dynamic> json) => _$DicesImpl(
      dice1: json['dice1'] as int,
      dice2: json['dice2'] as int,
    );

Map<String, dynamic> _$$DicesImplToJson(_$DicesImpl instance) =>
    <String, dynamic>{
      'dice1': instance.dice1,
      'dice2': instance.dice2,
    };

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      matchId: json['match_id'] as int,
      datetime: DateTime.parse(json['datetime'] as String),
      players: Players.fromJson(json['players'] as Map<String, dynamic>),
      dices: Dices.fromJson(json['dices'] as Map<String, dynamic>),
      winner: json['winner'] as int?,
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'match_id': instance.matchId,
      'datetime': instance.datetime.toIso8601String(),
      'players': instance.players,
      'dices': instance.dices,
      'winner': instance.winner,
    };
