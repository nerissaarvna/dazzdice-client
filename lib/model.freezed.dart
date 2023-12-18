// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get decorator => throw _privateConstructorUsedError;
  set decorator(int value) => throw _privateConstructorUsedError;
  MatchLeaderboard? get matchLeaderboard => throw _privateConstructorUsedError;
  set matchLeaderboard(MatchLeaderboard? value) =>
      throw _privateConstructorUsedError;
  ChallengeLeaderboard? get challengeLeaderboard =>
      throw _privateConstructorUsedError;
  set challengeLeaderboard(ChallengeLeaderboard? value) =>
      throw _privateConstructorUsedError;
  List<Match>? get matchs => throw _privateConstructorUsedError;
  set matchs(List<Match>? value) => throw _privateConstructorUsedError;
  List<Challenge>? get challenges => throw _privateConstructorUsedError;
  set challenges(List<Challenge>? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String name,
      int decorator,
      MatchLeaderboard? matchLeaderboard,
      ChallengeLeaderboard? challengeLeaderboard,
      List<Match>? matchs,
      List<Challenge>? challenges,
      DateTime? createdAt,
      DateTime? updatedAt});

  $MatchLeaderboardCopyWith<$Res>? get matchLeaderboard;
  $ChallengeLeaderboardCopyWith<$Res>? get challengeLeaderboard;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? decorator = null,
    Object? matchLeaderboard = freezed,
    Object? challengeLeaderboard = freezed,
    Object? matchs = freezed,
    Object? challenges = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decorator: null == decorator
          ? _value.decorator
          : decorator // ignore: cast_nullable_to_non_nullable
              as int,
      matchLeaderboard: freezed == matchLeaderboard
          ? _value.matchLeaderboard
          : matchLeaderboard // ignore: cast_nullable_to_non_nullable
              as MatchLeaderboard?,
      challengeLeaderboard: freezed == challengeLeaderboard
          ? _value.challengeLeaderboard
          : challengeLeaderboard // ignore: cast_nullable_to_non_nullable
              as ChallengeLeaderboard?,
      matchs: freezed == matchs
          ? _value.matchs
          : matchs // ignore: cast_nullable_to_non_nullable
              as List<Match>?,
      challenges: freezed == challenges
          ? _value.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchLeaderboardCopyWith<$Res>? get matchLeaderboard {
    if (_value.matchLeaderboard == null) {
      return null;
    }

    return $MatchLeaderboardCopyWith<$Res>(_value.matchLeaderboard!, (value) {
      return _then(_value.copyWith(matchLeaderboard: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChallengeLeaderboardCopyWith<$Res>? get challengeLeaderboard {
    if (_value.challengeLeaderboard == null) {
      return null;
    }

    return $ChallengeLeaderboardCopyWith<$Res>(_value.challengeLeaderboard!,
        (value) {
      return _then(_value.copyWith(challengeLeaderboard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int decorator,
      MatchLeaderboard? matchLeaderboard,
      ChallengeLeaderboard? challengeLeaderboard,
      List<Match>? matchs,
      List<Challenge>? challenges,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $MatchLeaderboardCopyWith<$Res>? get matchLeaderboard;
  @override
  $ChallengeLeaderboardCopyWith<$Res>? get challengeLeaderboard;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? decorator = null,
    Object? matchLeaderboard = freezed,
    Object? challengeLeaderboard = freezed,
    Object? matchs = freezed,
    Object? challenges = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decorator: null == decorator
          ? _value.decorator
          : decorator // ignore: cast_nullable_to_non_nullable
              as int,
      matchLeaderboard: freezed == matchLeaderboard
          ? _value.matchLeaderboard
          : matchLeaderboard // ignore: cast_nullable_to_non_nullable
              as MatchLeaderboard?,
      challengeLeaderboard: freezed == challengeLeaderboard
          ? _value.challengeLeaderboard
          : challengeLeaderboard // ignore: cast_nullable_to_non_nullable
              as ChallengeLeaderboard?,
      matchs: freezed == matchs
          ? _value.matchs
          : matchs // ignore: cast_nullable_to_non_nullable
              as List<Match>?,
      challenges: freezed == challenges
          ? _value.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  _$UserImpl(
      {required this.id,
      required this.name,
      required this.decorator,
      this.matchLeaderboard,
      this.challengeLeaderboard,
      this.matchs,
      this.challenges,
      this.createdAt,
      this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  String name;
  @override
  int decorator;
  @override
  MatchLeaderboard? matchLeaderboard;
  @override
  ChallengeLeaderboard? challengeLeaderboard;
  @override
  List<Match>? matchs;
  @override
  List<Challenge>? challenges;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, name: $name, decorator: $decorator, matchLeaderboard: $matchLeaderboard, challengeLeaderboard: $challengeLeaderboard, matchs: $matchs, challenges: $challenges, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('decorator', decorator))
      ..add(DiagnosticsProperty('matchLeaderboard', matchLeaderboard))
      ..add(DiagnosticsProperty('challengeLeaderboard', challengeLeaderboard))
      ..add(DiagnosticsProperty('matchs', matchs))
      ..add(DiagnosticsProperty('challenges', challenges))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String id,
      required String name,
      required int decorator,
      MatchLeaderboard? matchLeaderboard,
      ChallengeLeaderboard? challengeLeaderboard,
      List<Match>? matchs,
      List<Challenge>? challenges,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  set name(String value);
  @override
  int get decorator;
  set decorator(int value);
  @override
  MatchLeaderboard? get matchLeaderboard;
  set matchLeaderboard(MatchLeaderboard? value);
  @override
  ChallengeLeaderboard? get challengeLeaderboard;
  set challengeLeaderboard(ChallengeLeaderboard? value);
  @override
  List<Match>? get matchs;
  set matchs(List<Match>? value);
  @override
  List<Challenge>? get challenges;
  set challenges(List<Challenge>? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataEvent _$DataEventFromJson(Map<String, dynamic> json) {
  return _DataEvent.fromJson(json);
}

/// @nodoc
mixin _$DataEvent {
  String get event => throw _privateConstructorUsedError;
  set event(String value) => throw _privateConstructorUsedError;
  String? get sender => throw _privateConstructorUsedError;
  set sender(String? value) => throw _privateConstructorUsedError;
  Map<String, dynamic>? get params => throw _privateConstructorUsedError;
  set params(Map<String, dynamic>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataEventCopyWith<DataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataEventCopyWith<$Res> {
  factory $DataEventCopyWith(DataEvent value, $Res Function(DataEvent) then) =
      _$DataEventCopyWithImpl<$Res, DataEvent>;
  @useResult
  $Res call({String event, String? sender, Map<String, dynamic>? params});
}

/// @nodoc
class _$DataEventCopyWithImpl<$Res, $Val extends DataEvent>
    implements $DataEventCopyWith<$Res> {
  _$DataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? sender = freezed,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataEventImplCopyWith<$Res>
    implements $DataEventCopyWith<$Res> {
  factory _$$DataEventImplCopyWith(
          _$DataEventImpl value, $Res Function(_$DataEventImpl) then) =
      __$$DataEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String event, String? sender, Map<String, dynamic>? params});
}

/// @nodoc
class __$$DataEventImplCopyWithImpl<$Res>
    extends _$DataEventCopyWithImpl<$Res, _$DataEventImpl>
    implements _$$DataEventImplCopyWith<$Res> {
  __$$DataEventImplCopyWithImpl(
      _$DataEventImpl _value, $Res Function(_$DataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? sender = freezed,
    Object? params = freezed,
  }) {
    return _then(_$DataEventImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataEventImpl with DiagnosticableTreeMixin implements _DataEvent {
  _$DataEventImpl({required this.event, this.sender, this.params});

  factory _$DataEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataEventImplFromJson(json);

  @override
  String event;
  @override
  String? sender;
  @override
  Map<String, dynamic>? params;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataEvent(event: $event, sender: $sender, params: $params)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataEvent'))
      ..add(DiagnosticsProperty('event', event))
      ..add(DiagnosticsProperty('sender', sender))
      ..add(DiagnosticsProperty('params', params));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataEventImplCopyWith<_$DataEventImpl> get copyWith =>
      __$$DataEventImplCopyWithImpl<_$DataEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataEventImplToJson(
      this,
    );
  }
}

abstract class _DataEvent implements DataEvent {
  factory _DataEvent(
      {required String event,
      String? sender,
      Map<String, dynamic>? params}) = _$DataEventImpl;

  factory _DataEvent.fromJson(Map<String, dynamic> json) =
      _$DataEventImpl.fromJson;

  @override
  String get event;
  set event(String value);
  @override
  String? get sender;
  set sender(String? value);
  @override
  Map<String, dynamic>? get params;
  set params(Map<String, dynamic>? value);
  @override
  @JsonKey(ignore: true)
  _$$DataEventImplCopyWith<_$DataEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get id => throw _privateConstructorUsedError;
  String get player1Id => throw _privateConstructorUsedError;
  set player1Id(String value) => throw _privateConstructorUsedError;
  String get player2Id => throw _privateConstructorUsedError;
  set player2Id(String value) => throw _privateConstructorUsedError;
  User? get player1 => throw _privateConstructorUsedError;
  set player1(User? value) => throw _privateConstructorUsedError;
  User? get player2 => throw _privateConstructorUsedError;
  set player2(User? value) => throw _privateConstructorUsedError;
  int? get round => throw _privateConstructorUsedError;
  set round(int? value) => throw _privateConstructorUsedError;
  int? get winner => throw _privateConstructorUsedError;
  set winner(int? value) => throw _privateConstructorUsedError;
  List<Question>? get question => throw _privateConstructorUsedError;
  set question(List<Question>? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get player1Status => throw _privateConstructorUsedError;
  set player1Status(String? value) => throw _privateConstructorUsedError;
  String? get player2Status => throw _privateConstructorUsedError;
  set player2Status(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
  @useResult
  $Res call(
      {String id,
      String player1Id,
      String player2Id,
      User? player1,
      User? player2,
      int? round,
      int? winner,
      List<Question>? question,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? player1Status,
      String? player2Status});

  $UserCopyWith<$Res>? get player1;
  $UserCopyWith<$Res>? get player2;
}

/// @nodoc
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player1Id = null,
    Object? player2Id = null,
    Object? player1 = freezed,
    Object? player2 = freezed,
    Object? round = freezed,
    Object? winner = freezed,
    Object? question = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? player1Status = freezed,
    Object? player2Status = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player1Id: null == player1Id
          ? _value.player1Id
          : player1Id // ignore: cast_nullable_to_non_nullable
              as String,
      player2Id: null == player2Id
          ? _value.player2Id
          : player2Id // ignore: cast_nullable_to_non_nullable
              as String,
      player1: freezed == player1
          ? _value.player1
          : player1 // ignore: cast_nullable_to_non_nullable
              as User?,
      player2: freezed == player2
          ? _value.player2
          : player2 // ignore: cast_nullable_to_non_nullable
              as User?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      player1Status: freezed == player1Status
          ? _value.player1Status
          : player1Status // ignore: cast_nullable_to_non_nullable
              as String?,
      player2Status: freezed == player2Status
          ? _value.player2Status
          : player2Status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get player1 {
    if (_value.player1 == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.player1!, (value) {
      return _then(_value.copyWith(player1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get player2 {
    if (_value.player2 == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.player2!, (value) {
      return _then(_value.copyWith(player2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchImplCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$MatchImplCopyWith(
          _$MatchImpl value, $Res Function(_$MatchImpl) then) =
      __$$MatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String player1Id,
      String player2Id,
      User? player1,
      User? player2,
      int? round,
      int? winner,
      List<Question>? question,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? player1Status,
      String? player2Status});

  @override
  $UserCopyWith<$Res>? get player1;
  @override
  $UserCopyWith<$Res>? get player2;
}

/// @nodoc
class __$$MatchImplCopyWithImpl<$Res>
    extends _$MatchCopyWithImpl<$Res, _$MatchImpl>
    implements _$$MatchImplCopyWith<$Res> {
  __$$MatchImplCopyWithImpl(
      _$MatchImpl _value, $Res Function(_$MatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player1Id = null,
    Object? player2Id = null,
    Object? player1 = freezed,
    Object? player2 = freezed,
    Object? round = freezed,
    Object? winner = freezed,
    Object? question = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? player1Status = freezed,
    Object? player2Status = freezed,
  }) {
    return _then(_$MatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player1Id: null == player1Id
          ? _value.player1Id
          : player1Id // ignore: cast_nullable_to_non_nullable
              as String,
      player2Id: null == player2Id
          ? _value.player2Id
          : player2Id // ignore: cast_nullable_to_non_nullable
              as String,
      player1: freezed == player1
          ? _value.player1
          : player1 // ignore: cast_nullable_to_non_nullable
              as User?,
      player2: freezed == player2
          ? _value.player2
          : player2 // ignore: cast_nullable_to_non_nullable
              as User?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      player1Status: freezed == player1Status
          ? _value.player1Status
          : player1Status // ignore: cast_nullable_to_non_nullable
              as String?,
      player2Status: freezed == player2Status
          ? _value.player2Status
          : player2Status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchImpl with DiagnosticableTreeMixin implements _Match {
  _$MatchImpl(
      {required this.id,
      required this.player1Id,
      required this.player2Id,
      this.player1,
      this.player2,
      this.round,
      this.winner,
      this.question,
      this.createdAt,
      this.updatedAt,
      this.player1Status,
      this.player2Status});

  factory _$MatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImplFromJson(json);

  @override
  final String id;
  @override
  String player1Id;
  @override
  String player2Id;
  @override
  User? player1;
  @override
  User? player2;
  @override
  int? round;
  @override
  int? winner;
  @override
  List<Question>? question;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;
  @override
  String? player1Status;
  @override
  String? player2Status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Match(id: $id, player1Id: $player1Id, player2Id: $player2Id, player1: $player1, player2: $player2, round: $round, winner: $winner, question: $question, createdAt: $createdAt, updatedAt: $updatedAt, player1Status: $player1Status, player2Status: $player2Status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Match'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('player1Id', player1Id))
      ..add(DiagnosticsProperty('player2Id', player2Id))
      ..add(DiagnosticsProperty('player1', player1))
      ..add(DiagnosticsProperty('player2', player2))
      ..add(DiagnosticsProperty('round', round))
      ..add(DiagnosticsProperty('winner', winner))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('player1Status', player1Status))
      ..add(DiagnosticsProperty('player2Status', player2Status));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      __$$MatchImplCopyWithImpl<_$MatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchImplToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  factory _Match(
      {required final String id,
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
      String? player2Status}) = _$MatchImpl;

  factory _Match.fromJson(Map<String, dynamic> json) = _$MatchImpl.fromJson;

  @override
  String get id;
  @override
  String get player1Id;
  set player1Id(String value);
  @override
  String get player2Id;
  set player2Id(String value);
  @override
  User? get player1;
  set player1(User? value);
  @override
  User? get player2;
  set player2(User? value);
  @override
  int? get round;
  set round(int? value);
  @override
  int? get winner;
  set winner(int? value);
  @override
  List<Question>? get question;
  set question(List<Question>? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  String? get player1Status;
  set player1Status(String? value);
  @override
  String? get player2Status;
  set player2Status(String? value);
  @override
  @JsonKey(ignore: true)
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return _Challenge.fromJson(json);
}

/// @nodoc
mixin _$Challenge {
  String get id => throw _privateConstructorUsedError;
  String get playerId => throw _privateConstructorUsedError;
  User? get player => throw _privateConstructorUsedError;
  set player(User? value) => throw _privateConstructorUsedError;
  int? get round => throw _privateConstructorUsedError;
  set round(int? value) => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  set score(int? value) => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  set rank(int? value) => throw _privateConstructorUsedError;
  List<Question>? get question => throw _privateConstructorUsedError;
  set question(List<Question>? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeCopyWith<Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) =
      _$ChallengeCopyWithImpl<$Res, Challenge>;
  @useResult
  $Res call(
      {String id,
      String playerId,
      User? player,
      int? round,
      int? score,
      int? rank,
      List<Question>? question,
      DateTime? createdAt,
      DateTime? updatedAt});

  $UserCopyWith<$Res>? get player;
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res, $Val extends Challenge>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerId = null,
    Object? player = freezed,
    Object? round = freezed,
    Object? score = freezed,
    Object? rank = freezed,
    Object? question = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get player {
    if (_value.player == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.player!, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChallengeImplCopyWith<$Res>
    implements $ChallengeCopyWith<$Res> {
  factory _$$ChallengeImplCopyWith(
          _$ChallengeImpl value, $Res Function(_$ChallengeImpl) then) =
      __$$ChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String playerId,
      User? player,
      int? round,
      int? score,
      int? rank,
      List<Question>? question,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$ChallengeImplCopyWithImpl<$Res>
    extends _$ChallengeCopyWithImpl<$Res, _$ChallengeImpl>
    implements _$$ChallengeImplCopyWith<$Res> {
  __$$ChallengeImplCopyWithImpl(
      _$ChallengeImpl _value, $Res Function(_$ChallengeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerId = null,
    Object? player = freezed,
    Object? round = freezed,
    Object? score = freezed,
    Object? rank = freezed,
    Object? question = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ChallengeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeImpl with DiagnosticableTreeMixin implements _Challenge {
  _$ChallengeImpl(
      {required this.id,
      required this.playerId,
      this.player,
      this.round,
      this.score,
      this.rank,
      this.question,
      this.createdAt,
      this.updatedAt});

  factory _$ChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeImplFromJson(json);

  @override
  final String id;
  @override
  final String playerId;
  @override
  User? player;
  @override
  int? round;
  @override
  int? score;
  @override
  int? rank;
  @override
  List<Question>? question;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Challenge(id: $id, playerId: $playerId, player: $player, round: $round, score: $score, rank: $rank, question: $question, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Challenge'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('round', round))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('rank', rank))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      __$$ChallengeImplCopyWithImpl<_$ChallengeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeImplToJson(
      this,
    );
  }
}

abstract class _Challenge implements Challenge {
  factory _Challenge(
      {required final String id,
      required final String playerId,
      User? player,
      int? round,
      int? score,
      int? rank,
      List<Question>? question,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$ChallengeImpl;

  factory _Challenge.fromJson(Map<String, dynamic> json) =
      _$ChallengeImpl.fromJson;

  @override
  String get id;
  @override
  String get playerId;
  @override
  User? get player;
  set player(User? value);
  @override
  int? get round;
  set round(int? value);
  @override
  int? get score;
  set score(int? value);
  @override
  int? get rank;
  set rank(int? value);
  @override
  List<Question>? get question;
  set question(List<Question>? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChallengeLeaderboard _$ChallengeLeaderboardFromJson(Map<String, dynamic> json) {
  return _ChallengeLeaderboard.fromJson(json);
}

/// @nodoc
mixin _$ChallengeLeaderboard {
  String get playerId => throw _privateConstructorUsedError;
  String get challengeId => throw _privateConstructorUsedError;
  set challengeId(String value) => throw _privateConstructorUsedError;
  User? get player => throw _privateConstructorUsedError;
  set player(User? value) => throw _privateConstructorUsedError;
  int? get round => throw _privateConstructorUsedError;
  set round(int? value) => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  set score(int? value) => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  set rank(int? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeLeaderboardCopyWith<ChallengeLeaderboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeLeaderboardCopyWith<$Res> {
  factory $ChallengeLeaderboardCopyWith(ChallengeLeaderboard value,
          $Res Function(ChallengeLeaderboard) then) =
      _$ChallengeLeaderboardCopyWithImpl<$Res, ChallengeLeaderboard>;
  @useResult
  $Res call(
      {String playerId,
      String challengeId,
      User? player,
      int? round,
      int? score,
      int? rank,
      DateTime? createdAt,
      DateTime? updatedAt});

  $UserCopyWith<$Res>? get player;
}

/// @nodoc
class _$ChallengeLeaderboardCopyWithImpl<$Res,
        $Val extends ChallengeLeaderboard>
    implements $ChallengeLeaderboardCopyWith<$Res> {
  _$ChallengeLeaderboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? challengeId = null,
    Object? player = freezed,
    Object? round = freezed,
    Object? score = freezed,
    Object? rank = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get player {
    if (_value.player == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.player!, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChallengeLeaderboardImplCopyWith<$Res>
    implements $ChallengeLeaderboardCopyWith<$Res> {
  factory _$$ChallengeLeaderboardImplCopyWith(_$ChallengeLeaderboardImpl value,
          $Res Function(_$ChallengeLeaderboardImpl) then) =
      __$$ChallengeLeaderboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playerId,
      String challengeId,
      User? player,
      int? round,
      int? score,
      int? rank,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$ChallengeLeaderboardImplCopyWithImpl<$Res>
    extends _$ChallengeLeaderboardCopyWithImpl<$Res, _$ChallengeLeaderboardImpl>
    implements _$$ChallengeLeaderboardImplCopyWith<$Res> {
  __$$ChallengeLeaderboardImplCopyWithImpl(_$ChallengeLeaderboardImpl _value,
      $Res Function(_$ChallengeLeaderboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? challengeId = null,
    Object? player = freezed,
    Object? round = freezed,
    Object? score = freezed,
    Object? rank = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ChallengeLeaderboardImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeLeaderboardImpl
    with DiagnosticableTreeMixin
    implements _ChallengeLeaderboard {
  _$ChallengeLeaderboardImpl(
      {required this.playerId,
      required this.challengeId,
      this.player,
      this.round,
      this.score,
      this.rank,
      this.createdAt,
      this.updatedAt});

  factory _$ChallengeLeaderboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeLeaderboardImplFromJson(json);

  @override
  final String playerId;
  @override
  String challengeId;
  @override
  User? player;
  @override
  int? round;
  @override
  int? score;
  @override
  int? rank;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChallengeLeaderboard(playerId: $playerId, challengeId: $challengeId, player: $player, round: $round, score: $score, rank: $rank, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChallengeLeaderboard'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('challengeId', challengeId))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('round', round))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('rank', rank))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeLeaderboardImplCopyWith<_$ChallengeLeaderboardImpl>
      get copyWith =>
          __$$ChallengeLeaderboardImplCopyWithImpl<_$ChallengeLeaderboardImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeLeaderboardImplToJson(
      this,
    );
  }
}

abstract class _ChallengeLeaderboard implements ChallengeLeaderboard {
  factory _ChallengeLeaderboard(
      {required final String playerId,
      required String challengeId,
      User? player,
      int? round,
      int? score,
      int? rank,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$ChallengeLeaderboardImpl;

  factory _ChallengeLeaderboard.fromJson(Map<String, dynamic> json) =
      _$ChallengeLeaderboardImpl.fromJson;

  @override
  String get playerId;
  @override
  String get challengeId;
  set challengeId(String value);
  @override
  User? get player;
  set player(User? value);
  @override
  int? get round;
  set round(int? value);
  @override
  int? get score;
  set score(int? value);
  @override
  int? get rank;
  set rank(int? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$ChallengeLeaderboardImplCopyWith<_$ChallengeLeaderboardImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchLeaderboard _$MatchLeaderboardFromJson(Map<String, dynamic> json) {
  return _MatchLeaderboard.fromJson(json);
}

/// @nodoc
mixin _$MatchLeaderboard {
  String get playerId => throw _privateConstructorUsedError;
  User? get player => throw _privateConstructorUsedError;
  set player(User? value) => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  set rating(int? value) => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  set rank(int? value) => throw _privateConstructorUsedError;
  int? get wins => throw _privateConstructorUsedError;
  set wins(int? value) => throw _privateConstructorUsedError;
  int? get loses => throw _privateConstructorUsedError;
  set loses(int? value) => throw _privateConstructorUsedError;
  int? get draws => throw _privateConstructorUsedError;
  set draws(int? value) => throw _privateConstructorUsedError;
  int? get plays => throw _privateConstructorUsedError;
  set plays(int? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchLeaderboardCopyWith<MatchLeaderboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLeaderboardCopyWith<$Res> {
  factory $MatchLeaderboardCopyWith(
          MatchLeaderboard value, $Res Function(MatchLeaderboard) then) =
      _$MatchLeaderboardCopyWithImpl<$Res, MatchLeaderboard>;
  @useResult
  $Res call(
      {String playerId,
      User? player,
      int? rating,
      int? rank,
      int? wins,
      int? loses,
      int? draws,
      int? plays,
      DateTime? createdAt,
      DateTime? updatedAt});

  $UserCopyWith<$Res>? get player;
}

/// @nodoc
class _$MatchLeaderboardCopyWithImpl<$Res, $Val extends MatchLeaderboard>
    implements $MatchLeaderboardCopyWith<$Res> {
  _$MatchLeaderboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? player = freezed,
    Object? rating = freezed,
    Object? rank = freezed,
    Object? wins = freezed,
    Object? loses = freezed,
    Object? draws = freezed,
    Object? plays = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      loses: freezed == loses
          ? _value.loses
          : loses // ignore: cast_nullable_to_non_nullable
              as int?,
      draws: freezed == draws
          ? _value.draws
          : draws // ignore: cast_nullable_to_non_nullable
              as int?,
      plays: freezed == plays
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get player {
    if (_value.player == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.player!, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchLeaderboardImplCopyWith<$Res>
    implements $MatchLeaderboardCopyWith<$Res> {
  factory _$$MatchLeaderboardImplCopyWith(_$MatchLeaderboardImpl value,
          $Res Function(_$MatchLeaderboardImpl) then) =
      __$$MatchLeaderboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playerId,
      User? player,
      int? rating,
      int? rank,
      int? wins,
      int? loses,
      int? draws,
      int? plays,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$MatchLeaderboardImplCopyWithImpl<$Res>
    extends _$MatchLeaderboardCopyWithImpl<$Res, _$MatchLeaderboardImpl>
    implements _$$MatchLeaderboardImplCopyWith<$Res> {
  __$$MatchLeaderboardImplCopyWithImpl(_$MatchLeaderboardImpl _value,
      $Res Function(_$MatchLeaderboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? player = freezed,
    Object? rating = freezed,
    Object? rank = freezed,
    Object? wins = freezed,
    Object? loses = freezed,
    Object? draws = freezed,
    Object? plays = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MatchLeaderboardImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      loses: freezed == loses
          ? _value.loses
          : loses // ignore: cast_nullable_to_non_nullable
              as int?,
      draws: freezed == draws
          ? _value.draws
          : draws // ignore: cast_nullable_to_non_nullable
              as int?,
      plays: freezed == plays
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchLeaderboardImpl
    with DiagnosticableTreeMixin
    implements _MatchLeaderboard {
  _$MatchLeaderboardImpl(
      {required this.playerId,
      this.player,
      this.rating,
      this.rank,
      this.wins,
      this.loses,
      this.draws,
      this.plays,
      this.createdAt,
      this.updatedAt});

  factory _$MatchLeaderboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchLeaderboardImplFromJson(json);

  @override
  final String playerId;
  @override
  User? player;
  @override
  int? rating;
  @override
  int? rank;
  @override
  int? wins;
  @override
  int? loses;
  @override
  int? draws;
  @override
  int? plays;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLeaderboard(playerId: $playerId, player: $player, rating: $rating, rank: $rank, wins: $wins, loses: $loses, draws: $draws, plays: $plays, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLeaderboard'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('rank', rank))
      ..add(DiagnosticsProperty('wins', wins))
      ..add(DiagnosticsProperty('loses', loses))
      ..add(DiagnosticsProperty('draws', draws))
      ..add(DiagnosticsProperty('plays', plays))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchLeaderboardImplCopyWith<_$MatchLeaderboardImpl> get copyWith =>
      __$$MatchLeaderboardImplCopyWithImpl<_$MatchLeaderboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchLeaderboardImplToJson(
      this,
    );
  }
}

abstract class _MatchLeaderboard implements MatchLeaderboard {
  factory _MatchLeaderboard(
      {required final String playerId,
      User? player,
      int? rating,
      int? rank,
      int? wins,
      int? loses,
      int? draws,
      int? plays,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$MatchLeaderboardImpl;

  factory _MatchLeaderboard.fromJson(Map<String, dynamic> json) =
      _$MatchLeaderboardImpl.fromJson;

  @override
  String get playerId;
  @override
  User? get player;
  set player(User? value);
  @override
  int? get rating;
  set rating(int? value);
  @override
  int? get rank;
  set rank(int? value);
  @override
  int? get wins;
  set wins(int? value);
  @override
  int? get loses;
  set loses(int? value);
  @override
  int? get draws;
  set draws(int? value);
  @override
  int? get plays;
  set plays(int? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$MatchLeaderboardImplCopyWith<_$MatchLeaderboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String? get challengeId => throw _privateConstructorUsedError;
  set challengeId(String? value) => throw _privateConstructorUsedError;
  String? get matchId => throw _privateConstructorUsedError;
  set matchId(String? value) => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;
  set difficulty(int value) => throw _privateConstructorUsedError;
  int get num1 => throw _privateConstructorUsedError;
  set num1(int value) => throw _privateConstructorUsedError;
  String get op => throw _privateConstructorUsedError;
  set op(String value) => throw _privateConstructorUsedError;
  int get num2 => throw _privateConstructorUsedError;
  set num2(int value) => throw _privateConstructorUsedError;
  int? get answer => throw _privateConstructorUsedError;
  set answer(int? value) => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  set score(int? value) => throw _privateConstructorUsedError;
  int? get score2 => throw _privateConstructorUsedError;
  set score2(int? value) => throw _privateConstructorUsedError;
  List<int>? get wrong => throw _privateConstructorUsedError;
  set wrong(List<int>? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int id,
      String? challengeId,
      String? matchId,
      int difficulty,
      int num1,
      String op,
      int num2,
      int? answer,
      int? score,
      int? score2,
      List<int>? wrong,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? challengeId = freezed,
    Object? matchId = freezed,
    Object? difficulty = null,
    Object? num1 = null,
    Object? op = null,
    Object? num2 = null,
    Object? answer = freezed,
    Object? score = freezed,
    Object? score2 = freezed,
    Object? wrong = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      matchId: freezed == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      num1: null == num1
          ? _value.num1
          : num1 // ignore: cast_nullable_to_non_nullable
              as int,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      num2: null == num2
          ? _value.num2
          : num2 // ignore: cast_nullable_to_non_nullable
              as int,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      score2: freezed == score2
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int?,
      wrong: freezed == wrong
          ? _value.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? challengeId,
      String? matchId,
      int difficulty,
      int num1,
      String op,
      int num2,
      int? answer,
      int? score,
      int? score2,
      List<int>? wrong,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? challengeId = freezed,
    Object? matchId = freezed,
    Object? difficulty = null,
    Object? num1 = null,
    Object? op = null,
    Object? num2 = null,
    Object? answer = freezed,
    Object? score = freezed,
    Object? score2 = freezed,
    Object? wrong = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$QuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String?,
      matchId: freezed == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      num1: null == num1
          ? _value.num1
          : num1 // ignore: cast_nullable_to_non_nullable
              as int,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      num2: null == num2
          ? _value.num2
          : num2 // ignore: cast_nullable_to_non_nullable
              as int,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      score2: freezed == score2
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int?,
      wrong: freezed == wrong
          ? _value.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl with DiagnosticableTreeMixin implements _Question {
  _$QuestionImpl(
      {required this.id,
      this.challengeId,
      this.matchId,
      required this.difficulty,
      required this.num1,
      required this.op,
      required this.num2,
      this.answer,
      this.score,
      this.score2,
      this.wrong,
      this.createdAt,
      this.updatedAt});

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final int id;
  @override
  String? challengeId;
  @override
  String? matchId;
  @override
  int difficulty;
  @override
  int num1;
  @override
  String op;
  @override
  int num2;
  @override
  int? answer;
  @override
  int? score;
  @override
  int? score2;
  @override
  List<int>? wrong;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Question(id: $id, challengeId: $challengeId, matchId: $matchId, difficulty: $difficulty, num1: $num1, op: $op, num2: $num2, answer: $answer, score: $score, score2: $score2, wrong: $wrong, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Question'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('challengeId', challengeId))
      ..add(DiagnosticsProperty('matchId', matchId))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('num1', num1))
      ..add(DiagnosticsProperty('op', op))
      ..add(DiagnosticsProperty('num2', num2))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('score2', score2))
      ..add(DiagnosticsProperty('wrong', wrong))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
      {required final int id,
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
      DateTime? updatedAt}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  int get id;
  @override
  String? get challengeId;
  set challengeId(String? value);
  @override
  String? get matchId;
  set matchId(String? value);
  @override
  int get difficulty;
  set difficulty(int value);
  @override
  int get num1;
  set num1(int value);
  @override
  String get op;
  set op(String value);
  @override
  int get num2;
  set num2(int value);
  @override
  int? get answer;
  set answer(int? value);
  @override
  int? get score;
  set score(int? value);
  @override
  int? get score2;
  set score2(int? value);
  @override
  List<int>? get wrong;
  set wrong(List<int>? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
