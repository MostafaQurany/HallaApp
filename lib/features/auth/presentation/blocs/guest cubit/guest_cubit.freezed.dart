// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GuestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestStateCopyWith<$Res> {
  factory $GuestStateCopyWith(
          GuestState value, $Res Function(GuestState) then) =
      _$GuestStateCopyWithImpl<$Res, GuestState>;
}

/// @nodoc
class _$GuestStateCopyWithImpl<$Res, $Val extends GuestState>
    implements $GuestStateCopyWith<$Res> {
  _$GuestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestState
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
    extends _$GuestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GuestState.initial()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GuestState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GuestStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GuestState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements GuestState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GuestStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GuestState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements GuestState {
  const factory Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteGuestSuccessImplCopyWith<$Res> {
  factory _$$DeleteGuestSuccessImplCopyWith(_$DeleteGuestSuccessImpl value,
          $Res Function(_$DeleteGuestSuccessImpl) then) =
      __$$DeleteGuestSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteGuestSuccessImplCopyWithImpl<$Res>
    extends _$GuestStateCopyWithImpl<$Res, _$DeleteGuestSuccessImpl>
    implements _$$DeleteGuestSuccessImplCopyWith<$Res> {
  __$$DeleteGuestSuccessImplCopyWithImpl(_$DeleteGuestSuccessImpl _value,
      $Res Function(_$DeleteGuestSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteGuestSuccessImpl implements DeleteGuestSuccess {
  const _$DeleteGuestSuccessImpl();

  @override
  String toString() {
    return 'GuestState.deleteGuestSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteGuestSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return deleteGuestSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return deleteGuestSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (deleteGuestSuccess != null) {
      return deleteGuestSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return deleteGuestSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return deleteGuestSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (deleteGuestSuccess != null) {
      return deleteGuestSuccess(this);
    }
    return orElse();
  }
}

abstract class DeleteGuestSuccess implements GuestState {
  const factory DeleteGuestSuccess() = _$DeleteGuestSuccessImpl;
}

/// @nodoc
abstract class _$$CreateNewGuestSuccessImplCopyWith<$Res> {
  factory _$$CreateNewGuestSuccessImplCopyWith(
          _$CreateNewGuestSuccessImpl value,
          $Res Function(_$CreateNewGuestSuccessImpl) then) =
      __$$CreateNewGuestSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateNewGuestSuccessImplCopyWithImpl<$Res>
    extends _$GuestStateCopyWithImpl<$Res, _$CreateNewGuestSuccessImpl>
    implements _$$CreateNewGuestSuccessImplCopyWith<$Res> {
  __$$CreateNewGuestSuccessImplCopyWithImpl(_$CreateNewGuestSuccessImpl _value,
      $Res Function(_$CreateNewGuestSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateNewGuestSuccessImpl implements CreateNewGuestSuccess {
  const _$CreateNewGuestSuccessImpl();

  @override
  String toString() {
    return 'GuestState.createNewGuestSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewGuestSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return createNewGuestSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return createNewGuestSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (createNewGuestSuccess != null) {
      return createNewGuestSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return createNewGuestSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return createNewGuestSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (createNewGuestSuccess != null) {
      return createNewGuestSuccess(this);
    }
    return orElse();
  }
}

abstract class CreateNewGuestSuccess implements GuestState {
  const factory CreateNewGuestSuccess() = _$CreateNewGuestSuccessImpl;
}

/// @nodoc
abstract class _$$LoginGuestSuccessImplCopyWith<$Res> {
  factory _$$LoginGuestSuccessImplCopyWith(_$LoginGuestSuccessImpl value,
          $Res Function(_$LoginGuestSuccessImpl) then) =
      __$$LoginGuestSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Guest guest});
}

/// @nodoc
class __$$LoginGuestSuccessImplCopyWithImpl<$Res>
    extends _$GuestStateCopyWithImpl<$Res, _$LoginGuestSuccessImpl>
    implements _$$LoginGuestSuccessImplCopyWith<$Res> {
  __$$LoginGuestSuccessImplCopyWithImpl(_$LoginGuestSuccessImpl _value,
      $Res Function(_$LoginGuestSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guest = null,
  }) {
    return _then(_$LoginGuestSuccessImpl(
      null == guest
          ? _value.guest
          : guest // ignore: cast_nullable_to_non_nullable
              as Guest,
    ));
  }
}

/// @nodoc

class _$LoginGuestSuccessImpl implements LoginGuestSuccess {
  const _$LoginGuestSuccessImpl(this.guest);

  @override
  final Guest guest;

  @override
  String toString() {
    return 'GuestState.loginGuestSuccess(guest: $guest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginGuestSuccessImpl &&
            (identical(other.guest, guest) || other.guest == guest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guest);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginGuestSuccessImplCopyWith<_$LoginGuestSuccessImpl> get copyWith =>
      __$$LoginGuestSuccessImplCopyWithImpl<_$LoginGuestSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return loginGuestSuccess(guest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return loginGuestSuccess?.call(guest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (loginGuestSuccess != null) {
      return loginGuestSuccess(guest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return loginGuestSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return loginGuestSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (loginGuestSuccess != null) {
      return loginGuestSuccess(this);
    }
    return orElse();
  }
}

abstract class LoginGuestSuccess implements GuestState {
  const factory LoginGuestSuccess(final Guest guest) = _$LoginGuestSuccessImpl;

  Guest get guest;

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginGuestSuccessImplCopyWith<_$LoginGuestSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsUpdateGuestSuccessImplCopyWith<$Res> {
  factory _$$IsUpdateGuestSuccessImplCopyWith(_$IsUpdateGuestSuccessImpl value,
          $Res Function(_$IsUpdateGuestSuccessImpl) then) =
      __$$IsUpdateGuestSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Guest guest});
}

/// @nodoc
class __$$IsUpdateGuestSuccessImplCopyWithImpl<$Res>
    extends _$GuestStateCopyWithImpl<$Res, _$IsUpdateGuestSuccessImpl>
    implements _$$IsUpdateGuestSuccessImplCopyWith<$Res> {
  __$$IsUpdateGuestSuccessImplCopyWithImpl(_$IsUpdateGuestSuccessImpl _value,
      $Res Function(_$IsUpdateGuestSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guest = null,
  }) {
    return _then(_$IsUpdateGuestSuccessImpl(
      null == guest
          ? _value.guest
          : guest // ignore: cast_nullable_to_non_nullable
              as Guest,
    ));
  }
}

/// @nodoc

class _$IsUpdateGuestSuccessImpl implements IsUpdateGuestSuccess {
  const _$IsUpdateGuestSuccessImpl(this.guest);

  @override
  final Guest guest;

  @override
  String toString() {
    return 'GuestState.isUpdateGuestSuccess(guest: $guest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsUpdateGuestSuccessImpl &&
            (identical(other.guest, guest) || other.guest == guest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guest);

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsUpdateGuestSuccessImplCopyWith<_$IsUpdateGuestSuccessImpl>
      get copyWith =>
          __$$IsUpdateGuestSuccessImplCopyWithImpl<_$IsUpdateGuestSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() deleteGuestSuccess,
    required TResult Function() createNewGuestSuccess,
    required TResult Function(Guest guest) loginGuestSuccess,
    required TResult Function(Guest guest) isUpdateGuestSuccess,
  }) {
    return isUpdateGuestSuccess(guest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? deleteGuestSuccess,
    TResult? Function()? createNewGuestSuccess,
    TResult? Function(Guest guest)? loginGuestSuccess,
    TResult? Function(Guest guest)? isUpdateGuestSuccess,
  }) {
    return isUpdateGuestSuccess?.call(guest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? deleteGuestSuccess,
    TResult Function()? createNewGuestSuccess,
    TResult Function(Guest guest)? loginGuestSuccess,
    TResult Function(Guest guest)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (isUpdateGuestSuccess != null) {
      return isUpdateGuestSuccess(guest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(DeleteGuestSuccess value) deleteGuestSuccess,
    required TResult Function(CreateNewGuestSuccess value)
        createNewGuestSuccess,
    required TResult Function(LoginGuestSuccess value) loginGuestSuccess,
    required TResult Function(IsUpdateGuestSuccess value) isUpdateGuestSuccess,
  }) {
    return isUpdateGuestSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult? Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult? Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult? Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
  }) {
    return isUpdateGuestSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(DeleteGuestSuccess value)? deleteGuestSuccess,
    TResult Function(CreateNewGuestSuccess value)? createNewGuestSuccess,
    TResult Function(LoginGuestSuccess value)? loginGuestSuccess,
    TResult Function(IsUpdateGuestSuccess value)? isUpdateGuestSuccess,
    required TResult orElse(),
  }) {
    if (isUpdateGuestSuccess != null) {
      return isUpdateGuestSuccess(this);
    }
    return orElse();
  }
}

abstract class IsUpdateGuestSuccess implements GuestState {
  const factory IsUpdateGuestSuccess(final Guest guest) =
      _$IsUpdateGuestSuccessImpl;

  Guest get guest;

  /// Create a copy of GuestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsUpdateGuestSuccessImplCopyWith<_$IsUpdateGuestSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
