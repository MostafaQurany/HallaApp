// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NfcState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NfcStateCopyWith<$Res> {
  factory $NfcStateCopyWith(NfcState value, $Res Function(NfcState) then) =
      _$NfcStateCopyWithImpl<$Res, NfcState>;
}

/// @nodoc
class _$NfcStateCopyWithImpl<$Res, $Val extends NfcState>
    implements $NfcStateCopyWith<$Res> {
  _$NfcStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NfcState
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
    extends _$NfcStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NfcState.initial()';
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
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
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
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NfcState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NFCAvailableImplCopyWith<$Res> {
  factory _$$NFCAvailableImplCopyWith(
          _$NFCAvailableImpl value, $Res Function(_$NFCAvailableImpl) then) =
      __$$NFCAvailableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAvailable});
}

/// @nodoc
class __$$NFCAvailableImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$NFCAvailableImpl>
    implements _$$NFCAvailableImplCopyWith<$Res> {
  __$$NFCAvailableImplCopyWithImpl(
      _$NFCAvailableImpl _value, $Res Function(_$NFCAvailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_$NFCAvailableImpl(
      null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NFCAvailableImpl implements NFCAvailable {
  const _$NFCAvailableImpl(this.isAvailable);

  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'NfcState.nfcAvailable(isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCAvailableImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAvailable);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCAvailableImplCopyWith<_$NFCAvailableImpl> get copyWith =>
      __$$NFCAvailableImplCopyWithImpl<_$NFCAvailableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return nfcAvailable(isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return nfcAvailable?.call(isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcAvailable != null) {
      return nfcAvailable(isAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return nfcAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return nfcAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcAvailable != null) {
      return nfcAvailable(this);
    }
    return orElse();
  }
}

abstract class NFCAvailable implements NfcState {
  const factory NFCAvailable(final bool isAvailable) = _$NFCAvailableImpl;

  bool get isAvailable;

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFCAvailableImplCopyWith<_$NFCAvailableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NfcLoadingImplCopyWith<$Res> {
  factory _$$NfcLoadingImplCopyWith(
          _$NfcLoadingImpl value, $Res Function(_$NfcLoadingImpl) then) =
      __$$NfcLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NfcLoadingImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$NfcLoadingImpl>
    implements _$$NfcLoadingImplCopyWith<$Res> {
  __$$NfcLoadingImplCopyWithImpl(
      _$NfcLoadingImpl _value, $Res Function(_$NfcLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NfcLoadingImpl implements NfcLoading {
  const _$NfcLoadingImpl();

  @override
  String toString() {
    return 'NfcState.nfcLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NfcLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return nfcLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return nfcLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcLoading != null) {
      return nfcLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return nfcLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return nfcLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcLoading != null) {
      return nfcLoading(this);
    }
    return orElse();
  }
}

abstract class NfcLoading implements NfcState {
  const factory NfcLoading() = _$NfcLoadingImpl;
}

/// @nodoc
abstract class _$$NFCErrorImplCopyWith<$Res> {
  factory _$$NFCErrorImplCopyWith(
          _$NFCErrorImpl value, $Res Function(_$NFCErrorImpl) then) =
      __$$NFCErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$NFCErrorImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$NFCErrorImpl>
    implements _$$NFCErrorImplCopyWith<$Res> {
  __$$NFCErrorImplCopyWithImpl(
      _$NFCErrorImpl _value, $Res Function(_$NFCErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$NFCErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NFCErrorImpl implements NFCError {
  const _$NFCErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'NfcState.nfcError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCErrorImplCopyWith<_$NFCErrorImpl> get copyWith =>
      __$$NFCErrorImplCopyWithImpl<_$NFCErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return nfcError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return nfcError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcError != null) {
      return nfcError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return nfcError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return nfcError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcError != null) {
      return nfcError(this);
    }
    return orElse();
  }
}

abstract class NFCError implements NfcState {
  const factory NFCError(final String error) = _$NFCErrorImpl;

  String get error;

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFCErrorImplCopyWith<_$NFCErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NFCStateImplCopyWith<$Res> {
  factory _$$NFCStateImplCopyWith(
          _$NFCStateImpl value, $Res Function(_$NFCStateImpl) then) =
      __$$NFCStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class __$$NFCStateImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$NFCStateImpl>
    implements _$$NFCStateImplCopyWith<$Res> {
  __$$NFCStateImplCopyWithImpl(
      _$NFCStateImpl _value, $Res Function(_$NFCStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
  }) {
    return _then(_$NFCStateImpl(
      null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NFCStateImpl implements NFCState {
  const _$NFCStateImpl(this.isOpen);

  @override
  final bool isOpen;

  @override
  String toString() {
    return 'NfcState.nfcState(isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCStateImplCopyWith<_$NFCStateImpl> get copyWith =>
      __$$NFCStateImplCopyWithImpl<_$NFCStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return nfcState(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return nfcState?.call(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcState != null) {
      return nfcState(isOpen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return nfcState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return nfcState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcState != null) {
      return nfcState(this);
    }
    return orElse();
  }
}

abstract class NFCState implements NfcState {
  const factory NFCState(final bool isOpen) = _$NFCStateImpl;

  bool get isOpen;

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFCStateImplCopyWith<_$NFCStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NFCUseStateImplCopyWith<$Res> {
  factory _$$NFCUseStateImplCopyWith(
          _$NFCUseStateImpl value, $Res Function(_$NFCUseStateImpl) then) =
      __$$NFCUseStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NfcUse nfcUseState, String nfcId});
}

/// @nodoc
class __$$NFCUseStateImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$NFCUseStateImpl>
    implements _$$NFCUseStateImplCopyWith<$Res> {
  __$$NFCUseStateImplCopyWithImpl(
      _$NFCUseStateImpl _value, $Res Function(_$NFCUseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nfcUseState = null,
    Object? nfcId = null,
  }) {
    return _then(_$NFCUseStateImpl(
      null == nfcUseState
          ? _value.nfcUseState
          : nfcUseState // ignore: cast_nullable_to_non_nullable
              as NfcUse,
      null == nfcId
          ? _value.nfcId
          : nfcId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NFCUseStateImpl implements NFCUseState {
  const _$NFCUseStateImpl(this.nfcUseState, this.nfcId);

  @override
  final NfcUse nfcUseState;
  @override
  final String nfcId;

  @override
  String toString() {
    return 'NfcState.nfcUseState(nfcUseState: $nfcUseState, nfcId: $nfcId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCUseStateImpl &&
            (identical(other.nfcUseState, nfcUseState) ||
                other.nfcUseState == nfcUseState) &&
            (identical(other.nfcId, nfcId) || other.nfcId == nfcId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nfcUseState, nfcId);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCUseStateImplCopyWith<_$NFCUseStateImpl> get copyWith =>
      __$$NFCUseStateImplCopyWithImpl<_$NFCUseStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return nfcUseState(this.nfcUseState, nfcId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return nfcUseState?.call(this.nfcUseState, nfcId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcUseState != null) {
      return nfcUseState(this.nfcUseState, nfcId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return nfcUseState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return nfcUseState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcUseState != null) {
      return nfcUseState(this);
    }
    return orElse();
  }
}

abstract class NFCUseState implements NfcState {
  const factory NFCUseState(final NfcUse nfcUseState, final String nfcId) =
      _$NFCUseStateImpl;

  NfcUse get nfcUseState;
  String get nfcId;

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFCUseStateImplCopyWith<_$NFCUseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NFCReadNfcImplCopyWith<$Res> {
  factory _$$NFCReadNfcImplCopyWith(
          _$NFCReadNfcImpl value, $Res Function(_$NFCReadNfcImpl) then) =
      __$$NFCReadNfcImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NfcMessage nfcMessage});
}

/// @nodoc
class __$$NFCReadNfcImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$NFCReadNfcImpl>
    implements _$$NFCReadNfcImplCopyWith<$Res> {
  __$$NFCReadNfcImplCopyWithImpl(
      _$NFCReadNfcImpl _value, $Res Function(_$NFCReadNfcImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nfcMessage = null,
  }) {
    return _then(_$NFCReadNfcImpl(
      null == nfcMessage
          ? _value.nfcMessage
          : nfcMessage // ignore: cast_nullable_to_non_nullable
              as NfcMessage,
    ));
  }
}

/// @nodoc

class _$NFCReadNfcImpl implements NFCReadNfc {
  const _$NFCReadNfcImpl(this.nfcMessage);

  @override
  final NfcMessage nfcMessage;

  @override
  String toString() {
    return 'NfcState.nfcReadNfc(nfcMessage: $nfcMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFCReadNfcImpl &&
            (identical(other.nfcMessage, nfcMessage) ||
                other.nfcMessage == nfcMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nfcMessage);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFCReadNfcImplCopyWith<_$NFCReadNfcImpl> get copyWith =>
      __$$NFCReadNfcImplCopyWithImpl<_$NFCReadNfcImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return nfcReadNfc(nfcMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return nfcReadNfc?.call(nfcMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcReadNfc != null) {
      return nfcReadNfc(nfcMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return nfcReadNfc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return nfcReadNfc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (nfcReadNfc != null) {
      return nfcReadNfc(this);
    }
    return orElse();
  }
}

abstract class NFCReadNfc implements NfcState {
  const factory NFCReadNfc(final NfcMessage nfcMessage) = _$NFCReadNfcImpl;

  NfcMessage get nfcMessage;

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFCReadNfcImplCopyWith<_$NFCReadNfcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadUserLoadingImplCopyWith<$Res> {
  factory _$$UploadUserLoadingImplCopyWith(_$UploadUserLoadingImpl value,
          $Res Function(_$UploadUserLoadingImpl) then) =
      __$$UploadUserLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadUserLoadingImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$UploadUserLoadingImpl>
    implements _$$UploadUserLoadingImplCopyWith<$Res> {
  __$$UploadUserLoadingImplCopyWithImpl(_$UploadUserLoadingImpl _value,
      $Res Function(_$UploadUserLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UploadUserLoadingImpl implements UploadUserLoading {
  const _$UploadUserLoadingImpl();

  @override
  String toString() {
    return 'NfcState.uploadUserLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadUserLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return uploadUserLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return uploadUserLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (uploadUserLoading != null) {
      return uploadUserLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return uploadUserLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return uploadUserLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (uploadUserLoading != null) {
      return uploadUserLoading(this);
    }
    return orElse();
  }
}

abstract class UploadUserLoading implements NfcState {
  const factory UploadUserLoading() = _$UploadUserLoadingImpl;
}

/// @nodoc
abstract class _$$UploadUserErrorImplCopyWith<$Res> {
  factory _$$UploadUserErrorImplCopyWith(_$UploadUserErrorImpl value,
          $Res Function(_$UploadUserErrorImpl) then) =
      __$$UploadUserErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UploadUserErrorImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$UploadUserErrorImpl>
    implements _$$UploadUserErrorImplCopyWith<$Res> {
  __$$UploadUserErrorImplCopyWithImpl(
      _$UploadUserErrorImpl _value, $Res Function(_$UploadUserErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UploadUserErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadUserErrorImpl implements UploadUserError {
  const _$UploadUserErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NfcState.uploadUserError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadUserErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadUserErrorImplCopyWith<_$UploadUserErrorImpl> get copyWith =>
      __$$UploadUserErrorImplCopyWithImpl<_$UploadUserErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return uploadUserError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return uploadUserError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (uploadUserError != null) {
      return uploadUserError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return uploadUserError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return uploadUserError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (uploadUserError != null) {
      return uploadUserError(this);
    }
    return orElse();
  }
}

abstract class UploadUserError implements NfcState {
  const factory UploadUserError(final String message) = _$UploadUserErrorImpl;

  String get message;

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadUserErrorImplCopyWith<_$UploadUserErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadUserSuccessImplCopyWith<$Res> {
  factory _$$UploadUserSuccessImplCopyWith(_$UploadUserSuccessImpl value,
          $Res Function(_$UploadUserSuccessImpl) then) =
      __$$UploadUserSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadUserSuccessImplCopyWithImpl<$Res>
    extends _$NfcStateCopyWithImpl<$Res, _$UploadUserSuccessImpl>
    implements _$$UploadUserSuccessImplCopyWith<$Res> {
  __$$UploadUserSuccessImplCopyWithImpl(_$UploadUserSuccessImpl _value,
      $Res Function(_$UploadUserSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UploadUserSuccessImpl implements UploadUserSuccess {
  const _$UploadUserSuccessImpl();

  @override
  String toString() {
    return 'NfcState.uploadUserSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadUserSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
    required TResult Function() uploadUserLoading,
    required TResult Function(String message) uploadUserError,
    required TResult Function() uploadUserSuccess,
  }) {
    return uploadUserSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult? Function()? uploadUserLoading,
    TResult? Function(String message)? uploadUserError,
    TResult? Function()? uploadUserSuccess,
  }) {
    return uploadUserSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    TResult Function()? uploadUserLoading,
    TResult Function(String message)? uploadUserError,
    TResult Function()? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (uploadUserSuccess != null) {
      return uploadUserSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
    required TResult Function(UploadUserLoading value) uploadUserLoading,
    required TResult Function(UploadUserError value) uploadUserError,
    required TResult Function(UploadUserSuccess value) uploadUserSuccess,
  }) {
    return uploadUserSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
    TResult? Function(UploadUserLoading value)? uploadUserLoading,
    TResult? Function(UploadUserError value)? uploadUserError,
    TResult? Function(UploadUserSuccess value)? uploadUserSuccess,
  }) {
    return uploadUserSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    TResult Function(UploadUserLoading value)? uploadUserLoading,
    TResult Function(UploadUserError value)? uploadUserError,
    TResult Function(UploadUserSuccess value)? uploadUserSuccess,
    required TResult orElse(),
  }) {
    if (uploadUserSuccess != null) {
      return uploadUserSuccess(this);
    }
    return orElse();
  }
}

abstract class UploadUserSuccess implements NfcState {
  const factory UploadUserSuccess() = _$UploadUserSuccessImpl;
}
