// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isConnected) beggingConnection,
    required TResult Function() disconnected,
    required TResult Function() connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isConnected)? beggingConnection,
    TResult? Function()? disconnected,
    TResult? Function()? connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isConnected)? beggingConnection,
    TResult Function()? disconnected,
    TResult Function()? connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BeggingConnection value) beggingConnection,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connected value) connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BeggingConnection value)? beggingConnection,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connected value)? connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BeggingConnection value)? beggingConnection,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connected value)? connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkStateCopyWith<$Res> {
  factory $NetworkStateCopyWith(
          NetworkState value, $Res Function(NetworkState) then) =
      _$NetworkStateCopyWithImpl<$Res, NetworkState>;
}

/// @nodoc
class _$NetworkStateCopyWithImpl<$Res, $Val extends NetworkState>
    implements $NetworkStateCopyWith<$Res> {
  _$NetworkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NetworkState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isConnected) beggingConnection,
    required TResult Function() disconnected,
    required TResult Function() connected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isConnected)? beggingConnection,
    TResult? Function()? disconnected,
    TResult? Function()? connected,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isConnected)? beggingConnection,
    TResult Function()? disconnected,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BeggingConnection value) beggingConnection,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connected value) connected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BeggingConnection value)? beggingConnection,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connected value)? connected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BeggingConnection value)? beggingConnection,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connected value)? connected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NetworkState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$BeggingConnectionImplCopyWith<$Res> {
  factory _$$BeggingConnectionImplCopyWith(_$BeggingConnectionImpl value,
          $Res Function(_$BeggingConnectionImpl) then) =
      __$$BeggingConnectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class __$$BeggingConnectionImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$BeggingConnectionImpl>
    implements _$$BeggingConnectionImplCopyWith<$Res> {
  __$$BeggingConnectionImplCopyWithImpl(_$BeggingConnectionImpl _value,
      $Res Function(_$BeggingConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_$BeggingConnectionImpl(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BeggingConnectionImpl implements BeggingConnection {
  const _$BeggingConnectionImpl({required this.isConnected});

  @override
  final bool isConnected;

  @override
  String toString() {
    return 'NetworkState.beggingConnection(isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeggingConnectionImpl &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeggingConnectionImplCopyWith<_$BeggingConnectionImpl> get copyWith =>
      __$$BeggingConnectionImplCopyWithImpl<_$BeggingConnectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isConnected) beggingConnection,
    required TResult Function() disconnected,
    required TResult Function() connected,
  }) {
    return beggingConnection(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isConnected)? beggingConnection,
    TResult? Function()? disconnected,
    TResult? Function()? connected,
  }) {
    return beggingConnection?.call(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isConnected)? beggingConnection,
    TResult Function()? disconnected,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (beggingConnection != null) {
      return beggingConnection(isConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BeggingConnection value) beggingConnection,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connected value) connected,
  }) {
    return beggingConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BeggingConnection value)? beggingConnection,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connected value)? connected,
  }) {
    return beggingConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BeggingConnection value)? beggingConnection,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connected value)? connected,
    required TResult orElse(),
  }) {
    if (beggingConnection != null) {
      return beggingConnection(this);
    }
    return orElse();
  }
}

abstract class BeggingConnection implements NetworkState {
  const factory BeggingConnection({required final bool isConnected}) =
      _$BeggingConnectionImpl;

  bool get isConnected;

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeggingConnectionImplCopyWith<_$BeggingConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisconnectedImpl implements Disconnected {
  const _$DisconnectedImpl();

  @override
  String toString() {
    return 'NetworkState.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isConnected) beggingConnection,
    required TResult Function() disconnected,
    required TResult Function() connected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isConnected)? beggingConnection,
    TResult? Function()? disconnected,
    TResult? Function()? connected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isConnected)? beggingConnection,
    TResult Function()? disconnected,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BeggingConnection value) beggingConnection,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connected value) connected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BeggingConnection value)? beggingConnection,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connected value)? connected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BeggingConnection value)? beggingConnection,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connected value)? connected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class Disconnected implements NetworkState {
  const factory Disconnected() = _$DisconnectedImpl;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  const _$ConnectedImpl();

  @override
  String toString() {
    return 'NetworkState.connected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isConnected) beggingConnection,
    required TResult Function() disconnected,
    required TResult Function() connected,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isConnected)? beggingConnection,
    TResult? Function()? disconnected,
    TResult? Function()? connected,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isConnected)? beggingConnection,
    TResult Function()? disconnected,
    TResult Function()? connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BeggingConnection value) beggingConnection,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(Connected value) connected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BeggingConnection value)? beggingConnection,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(Connected value)? connected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BeggingConnection value)? beggingConnection,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(Connected value)? connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements NetworkState {
  const factory Connected() = _$ConnectedImpl;
}
