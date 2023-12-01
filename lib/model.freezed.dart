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

History _$HistoryFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
mixin _$History {
  int get win => throw _privateConstructorUsedError;
  int get lose => throw _privateConstructorUsedError;
  int get draw => throw _privateConstructorUsedError;
  int get plays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res, History>;
  @useResult
  $Res call({int win, int lose, int draw, int plays});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res, $Val extends History>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? win = null,
    Object? lose = null,
    Object? draw = null,
    Object? plays = null,
  }) {
    return _then(_value.copyWith(
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      lose: null == lose
          ? _value.lose
          : lose // ignore: cast_nullable_to_non_nullable
              as int,
      draw: null == draw
          ? _value.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as int,
      plays: null == plays
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryImplCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$HistoryImplCopyWith(
          _$HistoryImpl value, $Res Function(_$HistoryImpl) then) =
      __$$HistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int win, int lose, int draw, int plays});
}

/// @nodoc
class __$$HistoryImplCopyWithImpl<$Res>
    extends _$HistoryCopyWithImpl<$Res, _$HistoryImpl>
    implements _$$HistoryImplCopyWith<$Res> {
  __$$HistoryImplCopyWithImpl(
      _$HistoryImpl _value, $Res Function(_$HistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? win = null,
    Object? lose = null,
    Object? draw = null,
    Object? plays = null,
  }) {
    return _then(_$HistoryImpl(
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      lose: null == lose
          ? _value.lose
          : lose // ignore: cast_nullable_to_non_nullable
              as int,
      draw: null == draw
          ? _value.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as int,
      plays: null == plays
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryImpl with DiagnosticableTreeMixin implements _History {
  const _$HistoryImpl(
      {required this.win,
      required this.lose,
      required this.draw,
      required this.plays});

  factory _$HistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryImplFromJson(json);

  @override
  final int win;
  @override
  final int lose;
  @override
  final int draw;
  @override
  final int plays;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'History(win: $win, lose: $lose, draw: $draw, plays: $plays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'History'))
      ..add(DiagnosticsProperty('win', win))
      ..add(DiagnosticsProperty('lose', lose))
      ..add(DiagnosticsProperty('draw', draw))
      ..add(DiagnosticsProperty('plays', plays));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImpl &&
            (identical(other.win, win) || other.win == win) &&
            (identical(other.lose, lose) || other.lose == lose) &&
            (identical(other.draw, draw) || other.draw == draw) &&
            (identical(other.plays, plays) || other.plays == plays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, win, lose, draw, plays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      __$$HistoryImplCopyWithImpl<_$HistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryImplToJson(
      this,
    );
  }
}

abstract class _History implements History {
  const factory _History(
      {required final int win,
      required final int lose,
      required final int draw,
      required final int plays}) = _$HistoryImpl;

  factory _History.fromJson(Map<String, dynamic> json) = _$HistoryImpl.fromJson;

  @override
  int get win;
  @override
  int get lose;
  @override
  int get draw;
  @override
  int get plays;
  @override
  @JsonKey(ignore: true)
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  History? get history => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({String id, String name, History? history});

  $HistoryCopyWith<$Res>? get history;
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
    Object? history = freezed,
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
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as History?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HistoryCopyWith<$Res>? get history {
    if (_value.history == null) {
      return null;
    }

    return $HistoryCopyWith<$Res>(_value.history!, (value) {
      return _then(_value.copyWith(history: value) as $Val);
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
  $Res call({String id, String name, History? history});

  @override
  $HistoryCopyWith<$Res>? get history;
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
    Object? history = freezed,
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
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as History?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl({required this.id, required this.name, this.history});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final History? history;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, name: $name, history: $history)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('history', history));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.history, history) || other.history == history));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, history);

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
  const factory _User(
      {required final String id,
      required final String name,
      final History? history}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  History? get history;
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
  Map<String, dynamic> get params => throw _privateConstructorUsedError;
  set params(Map<String, dynamic> value) => throw _privateConstructorUsedError;

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
  $Res call({String event, Map<String, dynamic> params});
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
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
  $Res call({String event, Map<String, dynamic> params});
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
    Object? params = null,
  }) {
    return _then(_$DataEventImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataEventImpl with DiagnosticableTreeMixin implements _DataEvent {
  _$DataEventImpl({required this.event, required this.params});

  factory _$DataEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataEventImplFromJson(json);

  @override
  String event;
  @override
  Map<String, dynamic> params;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataEvent(event: $event, params: $params)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataEvent'))
      ..add(DiagnosticsProperty('event', event))
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
      required Map<String, dynamic> params}) = _$DataEventImpl;

  factory _DataEvent.fromJson(Map<String, dynamic> json) =
      _$DataEventImpl.fromJson;

  @override
  String get event;
  set event(String value);
  @override
  Map<String, dynamic> get params;
  set params(Map<String, dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$DataEventImplCopyWith<_$DataEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  User get player => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call({User player});

  $UserCopyWith<$Res> get player;
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get player {
    return $UserCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User player});

  @override
  $UserCopyWith<$Res> get player;
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
  }) {
    return _then(_$PlayerImpl(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl with DiagnosticableTreeMixin implements _Player {
  const _$PlayerImpl({required this.player});

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final User player;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Player(player: $player)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Player'))
      ..add(DiagnosticsProperty('player', player));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player({required final User player}) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  User get player;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Players _$PlayersFromJson(Map<String, dynamic> json) {
  return _Players.fromJson(json);
}

/// @nodoc
mixin _$Players {
  Player get player1 => throw _privateConstructorUsedError;
  Player get player2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayersCopyWith<Players> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayersCopyWith<$Res> {
  factory $PlayersCopyWith(Players value, $Res Function(Players) then) =
      _$PlayersCopyWithImpl<$Res, Players>;
  @useResult
  $Res call({Player player1, Player player2});

  $PlayerCopyWith<$Res> get player1;
  $PlayerCopyWith<$Res> get player2;
}

/// @nodoc
class _$PlayersCopyWithImpl<$Res, $Val extends Players>
    implements $PlayersCopyWith<$Res> {
  _$PlayersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player1 = null,
    Object? player2 = null,
  }) {
    return _then(_value.copyWith(
      player1: null == player1
          ? _value.player1
          : player1 // ignore: cast_nullable_to_non_nullable
              as Player,
      player2: null == player2
          ? _value.player2
          : player2 // ignore: cast_nullable_to_non_nullable
              as Player,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player1 {
    return $PlayerCopyWith<$Res>(_value.player1, (value) {
      return _then(_value.copyWith(player1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player2 {
    return $PlayerCopyWith<$Res>(_value.player2, (value) {
      return _then(_value.copyWith(player2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayersImplCopyWith<$Res> implements $PlayersCopyWith<$Res> {
  factory _$$PlayersImplCopyWith(
          _$PlayersImpl value, $Res Function(_$PlayersImpl) then) =
      __$$PlayersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Player player1, Player player2});

  @override
  $PlayerCopyWith<$Res> get player1;
  @override
  $PlayerCopyWith<$Res> get player2;
}

/// @nodoc
class __$$PlayersImplCopyWithImpl<$Res>
    extends _$PlayersCopyWithImpl<$Res, _$PlayersImpl>
    implements _$$PlayersImplCopyWith<$Res> {
  __$$PlayersImplCopyWithImpl(
      _$PlayersImpl _value, $Res Function(_$PlayersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player1 = null,
    Object? player2 = null,
  }) {
    return _then(_$PlayersImpl(
      player1: null == player1
          ? _value.player1
          : player1 // ignore: cast_nullable_to_non_nullable
              as Player,
      player2: null == player2
          ? _value.player2
          : player2 // ignore: cast_nullable_to_non_nullable
              as Player,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayersImpl with DiagnosticableTreeMixin implements _Players {
  const _$PlayersImpl({required this.player1, required this.player2});

  factory _$PlayersImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayersImplFromJson(json);

  @override
  final Player player1;
  @override
  final Player player2;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Players(player1: $player1, player2: $player2)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Players'))
      ..add(DiagnosticsProperty('player1', player1))
      ..add(DiagnosticsProperty('player2', player2));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayersImpl &&
            (identical(other.player1, player1) || other.player1 == player1) &&
            (identical(other.player2, player2) || other.player2 == player2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player1, player2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayersImplCopyWith<_$PlayersImpl> get copyWith =>
      __$$PlayersImplCopyWithImpl<_$PlayersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayersImplToJson(
      this,
    );
  }
}

abstract class _Players implements Players {
  const factory _Players(
      {required final Player player1,
      required final Player player2}) = _$PlayersImpl;

  factory _Players.fromJson(Map<String, dynamic> json) = _$PlayersImpl.fromJson;

  @override
  Player get player1;
  @override
  Player get player2;
  @override
  @JsonKey(ignore: true)
  _$$PlayersImplCopyWith<_$PlayersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Dices _$DicesFromJson(Map<String, dynamic> json) {
  return _Dices.fromJson(json);
}

/// @nodoc
mixin _$Dices {
  int get dice1 => throw _privateConstructorUsedError;
  set dice1(int value) => throw _privateConstructorUsedError;
  int get dice2 => throw _privateConstructorUsedError;
  set dice2(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DicesCopyWith<Dices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DicesCopyWith<$Res> {
  factory $DicesCopyWith(Dices value, $Res Function(Dices) then) =
      _$DicesCopyWithImpl<$Res, Dices>;
  @useResult
  $Res call({int dice1, int dice2});
}

/// @nodoc
class _$DicesCopyWithImpl<$Res, $Val extends Dices>
    implements $DicesCopyWith<$Res> {
  _$DicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dice1 = null,
    Object? dice2 = null,
  }) {
    return _then(_value.copyWith(
      dice1: null == dice1
          ? _value.dice1
          : dice1 // ignore: cast_nullable_to_non_nullable
              as int,
      dice2: null == dice2
          ? _value.dice2
          : dice2 // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DicesImplCopyWith<$Res> implements $DicesCopyWith<$Res> {
  factory _$$DicesImplCopyWith(
          _$DicesImpl value, $Res Function(_$DicesImpl) then) =
      __$$DicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int dice1, int dice2});
}

/// @nodoc
class __$$DicesImplCopyWithImpl<$Res>
    extends _$DicesCopyWithImpl<$Res, _$DicesImpl>
    implements _$$DicesImplCopyWith<$Res> {
  __$$DicesImplCopyWithImpl(
      _$DicesImpl _value, $Res Function(_$DicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dice1 = null,
    Object? dice2 = null,
  }) {
    return _then(_$DicesImpl(
      dice1: null == dice1
          ? _value.dice1
          : dice1 // ignore: cast_nullable_to_non_nullable
              as int,
      dice2: null == dice2
          ? _value.dice2
          : dice2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DicesImpl with DiagnosticableTreeMixin implements _Dices {
  _$DicesImpl({required this.dice1, required this.dice2});

  factory _$DicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DicesImplFromJson(json);

  @override
  int dice1;
  @override
  int dice2;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dices(dice1: $dice1, dice2: $dice2)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dices'))
      ..add(DiagnosticsProperty('dice1', dice1))
      ..add(DiagnosticsProperty('dice2', dice2));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DicesImplCopyWith<_$DicesImpl> get copyWith =>
      __$$DicesImplCopyWithImpl<_$DicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DicesImplToJson(
      this,
    );
  }
}

abstract class _Dices implements Dices {
  factory _Dices({required int dice1, required int dice2}) = _$DicesImpl;

  factory _Dices.fromJson(Map<String, dynamic> json) = _$DicesImpl.fromJson;

  @override
  int get dice1;
  set dice1(int value);
  @override
  int get dice2;
  set dice2(int value);
  @override
  @JsonKey(ignore: true)
  _$$DicesImplCopyWith<_$DicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  @JsonKey(name: "match_id")
  String get matchId => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  Players get players => throw _privateConstructorUsedError;
  Dices get dices => throw _privateConstructorUsedError;
  set dices(Dices value) => throw _privateConstructorUsedError;
  int? get winner => throw _privateConstructorUsedError;
  set winner(int? value) => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "match_id") String matchId,
      DateTime datetime,
      Players players,
      Dices dices,
      int? winner});

  $PlayersCopyWith<$Res> get players;
  $DicesCopyWith<$Res> get dices;
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
    Object? matchId = null,
    Object? datetime = null,
    Object? players = null,
    Object? dices = null,
    Object? winner = freezed,
  }) {
    return _then(_value.copyWith(
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Players,
      dices: null == dices
          ? _value.dices
          : dices // ignore: cast_nullable_to_non_nullable
              as Dices,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayersCopyWith<$Res> get players {
    return $PlayersCopyWith<$Res>(_value.players, (value) {
      return _then(_value.copyWith(players: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DicesCopyWith<$Res> get dices {
    return $DicesCopyWith<$Res>(_value.dices, (value) {
      return _then(_value.copyWith(dices: value) as $Val);
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
      {@JsonKey(name: "match_id") String matchId,
      DateTime datetime,
      Players players,
      Dices dices,
      int? winner});

  @override
  $PlayersCopyWith<$Res> get players;
  @override
  $DicesCopyWith<$Res> get dices;
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
    Object? matchId = null,
    Object? datetime = null,
    Object? players = null,
    Object? dices = null,
    Object? winner = freezed,
  }) {
    return _then(_$MatchImpl(
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Players,
      dices: null == dices
          ? _value.dices
          : dices // ignore: cast_nullable_to_non_nullable
              as Dices,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchImpl with DiagnosticableTreeMixin implements _Match {
  _$MatchImpl(
      {@JsonKey(name: "match_id") required this.matchId,
      required this.datetime,
      required this.players,
      required this.dices,
      required this.winner});

  factory _$MatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImplFromJson(json);

  @override
  @JsonKey(name: "match_id")
  final String matchId;
  @override
  final DateTime datetime;
  @override
  final Players players;
  @override
  Dices dices;
  @override
  int? winner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Match(matchId: $matchId, datetime: $datetime, players: $players, dices: $dices, winner: $winner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Match'))
      ..add(DiagnosticsProperty('matchId', matchId))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('dices', dices))
      ..add(DiagnosticsProperty('winner', winner));
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
      {@JsonKey(name: "match_id") required final String matchId,
      required final DateTime datetime,
      required final Players players,
      required Dices dices,
      required int? winner}) = _$MatchImpl;

  factory _Match.fromJson(Map<String, dynamic> json) = _$MatchImpl.fromJson;

  @override
  @JsonKey(name: "match_id")
  String get matchId;
  @override
  DateTime get datetime;
  @override
  Players get players;
  @override
  Dices get dices;
  set dices(Dices value);
  @override
  int? get winner;
  set winner(int? value);
  @override
  @JsonKey(ignore: true)
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
