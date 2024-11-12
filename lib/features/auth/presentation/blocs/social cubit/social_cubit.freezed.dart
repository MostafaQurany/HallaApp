// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SocialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialStateCopyWith<$Res> {
  factory $SocialStateCopyWith(
          SocialState value, $Res Function(SocialState) then) =
      _$SocialStateCopyWithImpl<$Res, SocialState>;
}

/// @nodoc
class _$SocialStateCopyWithImpl<$Res, $Val extends SocialState>
    implements $SocialStateCopyWith<$Res> {
  _$SocialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialState
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
    extends _$SocialStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SocialState.initial()';
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SocialState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GoogleLoadingImplCopyWith<$Res> {
  factory _$$GoogleLoadingImplCopyWith(
          _$GoogleLoadingImpl value, $Res Function(_$GoogleLoadingImpl) then) =
      __$$GoogleLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoadingImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$GoogleLoadingImpl>
    implements _$$GoogleLoadingImplCopyWith<$Res> {
  __$$GoogleLoadingImplCopyWithImpl(
      _$GoogleLoadingImpl _value, $Res Function(_$GoogleLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleLoadingImpl implements GoogleLoading {
  const _$GoogleLoadingImpl();

  @override
  String toString() {
    return 'SocialState.googleLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return googleLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return googleLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (googleLoading != null) {
      return googleLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return googleLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return googleLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (googleLoading != null) {
      return googleLoading(this);
    }
    return orElse();
  }
}

abstract class GoogleLoading implements SocialState {
  const factory GoogleLoading() = _$GoogleLoadingImpl;
}

/// @nodoc
abstract class _$$GoogleSuccessImplCopyWith<$Res> {
  factory _$$GoogleSuccessImplCopyWith(
          _$GoogleSuccessImpl value, $Res Function(_$GoogleSuccessImpl) then) =
      __$$GoogleSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> userState});
}

/// @nodoc
class __$$GoogleSuccessImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$GoogleSuccessImpl>
    implements _$$GoogleSuccessImplCopyWith<$Res> {
  __$$GoogleSuccessImplCopyWithImpl(
      _$GoogleSuccessImpl _value, $Res Function(_$GoogleSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
  }) {
    return _then(_$GoogleSuccessImpl(
      null == userState
          ? _value._userState
          : userState // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$GoogleSuccessImpl implements GoogleSuccess {
  const _$GoogleSuccessImpl(final Map<String, dynamic> userState)
      : _userState = userState;

  final Map<String, dynamic> _userState;
  @override
  Map<String, dynamic> get userState {
    if (_userState is EqualUnmodifiableMapView) return _userState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userState);
  }

  @override
  String toString() {
    return 'SocialState.googleSuccess(userState: $userState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._userState, _userState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_userState));

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSuccessImplCopyWith<_$GoogleSuccessImpl> get copyWith =>
      __$$GoogleSuccessImplCopyWithImpl<_$GoogleSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return googleSuccess(userState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return googleSuccess?.call(userState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (googleSuccess != null) {
      return googleSuccess(userState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return googleSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return googleSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (googleSuccess != null) {
      return googleSuccess(this);
    }
    return orElse();
  }
}

abstract class GoogleSuccess implements SocialState {
  const factory GoogleSuccess(final Map<String, dynamic> userState) =
      _$GoogleSuccessImpl;

  Map<String, dynamic> get userState;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleSuccessImplCopyWith<_$GoogleSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleErrorImplCopyWith<$Res> {
  factory _$$GoogleErrorImplCopyWith(
          _$GoogleErrorImpl value, $Res Function(_$GoogleErrorImpl) then) =
      __$$GoogleErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$GoogleErrorImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$GoogleErrorImpl>
    implements _$$GoogleErrorImplCopyWith<$Res> {
  __$$GoogleErrorImplCopyWithImpl(
      _$GoogleErrorImpl _value, $Res Function(_$GoogleErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$GoogleErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleErrorImpl implements GoogleError {
  const _$GoogleErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SocialState.googleError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleErrorImplCopyWith<_$GoogleErrorImpl> get copyWith =>
      __$$GoogleErrorImplCopyWithImpl<_$GoogleErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return googleError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return googleError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (googleError != null) {
      return googleError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return googleError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return googleError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (googleError != null) {
      return googleError(this);
    }
    return orElse();
  }
}

abstract class GoogleError implements SocialState {
  const factory GoogleError(final String errorMessage) = _$GoogleErrorImpl;

  String get errorMessage;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleErrorImplCopyWith<_$GoogleErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FacebookLoadingImplCopyWith<$Res> {
  factory _$$FacebookLoadingImplCopyWith(_$FacebookLoadingImpl value,
          $Res Function(_$FacebookLoadingImpl) then) =
      __$$FacebookLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacebookLoadingImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$FacebookLoadingImpl>
    implements _$$FacebookLoadingImplCopyWith<$Res> {
  __$$FacebookLoadingImplCopyWithImpl(
      _$FacebookLoadingImpl _value, $Res Function(_$FacebookLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FacebookLoadingImpl implements FacebookLoading {
  const _$FacebookLoadingImpl();

  @override
  String toString() {
    return 'SocialState.facebookLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FacebookLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return facebookLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return facebookLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (facebookLoading != null) {
      return facebookLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return facebookLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return facebookLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (facebookLoading != null) {
      return facebookLoading(this);
    }
    return orElse();
  }
}

abstract class FacebookLoading implements SocialState {
  const factory FacebookLoading() = _$FacebookLoadingImpl;
}

/// @nodoc
abstract class _$$FacebookSuccessImplCopyWith<$Res> {
  factory _$$FacebookSuccessImplCopyWith(_$FacebookSuccessImpl value,
          $Res Function(_$FacebookSuccessImpl) then) =
      __$$FacebookSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> userState});
}

/// @nodoc
class __$$FacebookSuccessImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$FacebookSuccessImpl>
    implements _$$FacebookSuccessImplCopyWith<$Res> {
  __$$FacebookSuccessImplCopyWithImpl(
      _$FacebookSuccessImpl _value, $Res Function(_$FacebookSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
  }) {
    return _then(_$FacebookSuccessImpl(
      null == userState
          ? _value._userState
          : userState // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$FacebookSuccessImpl implements FacebookSuccess {
  const _$FacebookSuccessImpl(final Map<String, dynamic> userState)
      : _userState = userState;

  final Map<String, dynamic> _userState;
  @override
  Map<String, dynamic> get userState {
    if (_userState is EqualUnmodifiableMapView) return _userState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userState);
  }

  @override
  String toString() {
    return 'SocialState.facebookSuccess(userState: $userState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._userState, _userState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_userState));

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacebookSuccessImplCopyWith<_$FacebookSuccessImpl> get copyWith =>
      __$$FacebookSuccessImplCopyWithImpl<_$FacebookSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return facebookSuccess(userState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return facebookSuccess?.call(userState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (facebookSuccess != null) {
      return facebookSuccess(userState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return facebookSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return facebookSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (facebookSuccess != null) {
      return facebookSuccess(this);
    }
    return orElse();
  }
}

abstract class FacebookSuccess implements SocialState {
  const factory FacebookSuccess(final Map<String, dynamic> userState) =
      _$FacebookSuccessImpl;

  Map<String, dynamic> get userState;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacebookSuccessImplCopyWith<_$FacebookSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FacebookErrorImplCopyWith<$Res> {
  factory _$$FacebookErrorImplCopyWith(
          _$FacebookErrorImpl value, $Res Function(_$FacebookErrorImpl) then) =
      __$$FacebookErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$FacebookErrorImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$FacebookErrorImpl>
    implements _$$FacebookErrorImplCopyWith<$Res> {
  __$$FacebookErrorImplCopyWithImpl(
      _$FacebookErrorImpl _value, $Res Function(_$FacebookErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$FacebookErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FacebookErrorImpl implements FacebookError {
  const _$FacebookErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SocialState.facebookError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacebookErrorImplCopyWith<_$FacebookErrorImpl> get copyWith =>
      __$$FacebookErrorImplCopyWithImpl<_$FacebookErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return facebookError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return facebookError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (facebookError != null) {
      return facebookError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return facebookError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return facebookError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (facebookError != null) {
      return facebookError(this);
    }
    return orElse();
  }
}

abstract class FacebookError implements SocialState {
  const factory FacebookError(final String errorMessage) = _$FacebookErrorImpl;

  String get errorMessage;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacebookErrorImplCopyWith<_$FacebookErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$SocialStateCopyWithImpl<$Res, _$NFCAvailableImpl>
    implements _$$NFCAvailableImplCopyWith<$Res> {
  __$$NFCAvailableImplCopyWithImpl(
      _$NFCAvailableImpl _value, $Res Function(_$NFCAvailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
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
    return 'SocialState.nfcAvailable(isAvailable: $isAvailable)';
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

  /// Create a copy of SocialState
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return nfcAvailable(isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return nfcAvailable?.call(isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return nfcAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return nfcAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (nfcAvailable != null) {
      return nfcAvailable(this);
    }
    return orElse();
  }
}

abstract class NFCAvailable implements SocialState {
  const factory NFCAvailable(final bool isAvailable) = _$NFCAvailableImpl;

  bool get isAvailable;

  /// Create a copy of SocialState
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
    extends _$SocialStateCopyWithImpl<$Res, _$NfcLoadingImpl>
    implements _$$NfcLoadingImplCopyWith<$Res> {
  __$$NfcLoadingImplCopyWithImpl(
      _$NfcLoadingImpl _value, $Res Function(_$NfcLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NfcLoadingImpl implements NfcLoading {
  const _$NfcLoadingImpl();

  @override
  String toString() {
    return 'SocialState.nfcLoading()';
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return nfcLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return nfcLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return nfcLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return nfcLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (nfcLoading != null) {
      return nfcLoading(this);
    }
    return orElse();
  }
}

abstract class NfcLoading implements SocialState {
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
    extends _$SocialStateCopyWithImpl<$Res, _$NFCErrorImpl>
    implements _$$NFCErrorImplCopyWith<$Res> {
  __$$NFCErrorImplCopyWithImpl(
      _$NFCErrorImpl _value, $Res Function(_$NFCErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
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
    return 'SocialState.nfcError(error: $error)';
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

  /// Create a copy of SocialState
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return nfcError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return nfcError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return nfcError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return nfcError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (nfcError != null) {
      return nfcError(this);
    }
    return orElse();
  }
}

abstract class NFCError implements SocialState {
  const factory NFCError(final String error) = _$NFCErrorImpl;

  String get error;

  /// Create a copy of SocialState
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
    extends _$SocialStateCopyWithImpl<$Res, _$NFCStateImpl>
    implements _$$NFCStateImplCopyWith<$Res> {
  __$$NFCStateImplCopyWithImpl(
      _$NFCStateImpl _value, $Res Function(_$NFCStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
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
    return 'SocialState.nfcState(isOpen: $isOpen)';
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

  /// Create a copy of SocialState
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return nfcState(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return nfcState?.call(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return nfcState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return nfcState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (nfcState != null) {
      return nfcState(this);
    }
    return orElse();
  }
}

abstract class NFCState implements SocialState {
  const factory NFCState(final bool isOpen) = _$NFCStateImpl;

  bool get isOpen;

  /// Create a copy of SocialState
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
    extends _$SocialStateCopyWithImpl<$Res, _$NFCUseStateImpl>
    implements _$$NFCUseStateImplCopyWith<$Res> {
  __$$NFCUseStateImplCopyWithImpl(
      _$NFCUseStateImpl _value, $Res Function(_$NFCUseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
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
    return 'SocialState.nfcUseState(nfcUseState: $nfcUseState, nfcId: $nfcId)';
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

  /// Create a copy of SocialState
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return nfcUseState(this.nfcUseState, nfcId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return nfcUseState?.call(this.nfcUseState, nfcId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return nfcUseState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return nfcUseState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (nfcUseState != null) {
      return nfcUseState(this);
    }
    return orElse();
  }
}

abstract class NFCUseState implements SocialState {
  const factory NFCUseState(final NfcUse nfcUseState, final String nfcId) =
      _$NFCUseStateImpl;

  NfcUse get nfcUseState;
  String get nfcId;

  /// Create a copy of SocialState
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
    extends _$SocialStateCopyWithImpl<$Res, _$NFCReadNfcImpl>
    implements _$$NFCReadNfcImplCopyWith<$Res> {
  __$$NFCReadNfcImplCopyWithImpl(
      _$NFCReadNfcImpl _value, $Res Function(_$NFCReadNfcImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
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
    return 'SocialState.nfcReadNfc(nfcMessage: $nfcMessage)';
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

  /// Create a copy of SocialState
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
    required TResult Function() googleLoading,
    required TResult Function(Map<String, dynamic> userState) googleSuccess,
    required TResult Function(String errorMessage) googleError,
    required TResult Function() facebookLoading,
    required TResult Function(Map<String, dynamic> userState) facebookSuccess,
    required TResult Function(String errorMessage) facebookError,
    required TResult Function(bool isAvailable) nfcAvailable,
    required TResult Function() nfcLoading,
    required TResult Function(String error) nfcError,
    required TResult Function(bool isOpen) nfcState,
    required TResult Function(NfcUse nfcUseState, String nfcId) nfcUseState,
    required TResult Function(NfcMessage nfcMessage) nfcReadNfc,
  }) {
    return nfcReadNfc(nfcMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? googleLoading,
    TResult? Function(Map<String, dynamic> userState)? googleSuccess,
    TResult? Function(String errorMessage)? googleError,
    TResult? Function()? facebookLoading,
    TResult? Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult? Function(String errorMessage)? facebookError,
    TResult? Function(bool isAvailable)? nfcAvailable,
    TResult? Function()? nfcLoading,
    TResult? Function(String error)? nfcError,
    TResult? Function(bool isOpen)? nfcState,
    TResult? Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult? Function(NfcMessage nfcMessage)? nfcReadNfc,
  }) {
    return nfcReadNfc?.call(nfcMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? googleLoading,
    TResult Function(Map<String, dynamic> userState)? googleSuccess,
    TResult Function(String errorMessage)? googleError,
    TResult Function()? facebookLoading,
    TResult Function(Map<String, dynamic> userState)? facebookSuccess,
    TResult Function(String errorMessage)? facebookError,
    TResult Function(bool isAvailable)? nfcAvailable,
    TResult Function()? nfcLoading,
    TResult Function(String error)? nfcError,
    TResult Function(bool isOpen)? nfcState,
    TResult Function(NfcUse nfcUseState, String nfcId)? nfcUseState,
    TResult Function(NfcMessage nfcMessage)? nfcReadNfc,
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
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(FacebookSuccess value) facebookSuccess,
    required TResult Function(FacebookError value) facebookError,
    required TResult Function(NFCAvailable value) nfcAvailable,
    required TResult Function(NfcLoading value) nfcLoading,
    required TResult Function(NFCError value) nfcError,
    required TResult Function(NFCState value) nfcState,
    required TResult Function(NFCUseState value) nfcUseState,
    required TResult Function(NFCReadNfc value) nfcReadNfc,
  }) {
    return nfcReadNfc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GoogleLoading value)? googleLoading,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(FacebookLoading value)? facebookLoading,
    TResult? Function(FacebookSuccess value)? facebookSuccess,
    TResult? Function(FacebookError value)? facebookError,
    TResult? Function(NFCAvailable value)? nfcAvailable,
    TResult? Function(NfcLoading value)? nfcLoading,
    TResult? Function(NFCError value)? nfcError,
    TResult? Function(NFCState value)? nfcState,
    TResult? Function(NFCUseState value)? nfcUseState,
    TResult? Function(NFCReadNfc value)? nfcReadNfc,
  }) {
    return nfcReadNfc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(FacebookSuccess value)? facebookSuccess,
    TResult Function(FacebookError value)? facebookError,
    TResult Function(NFCAvailable value)? nfcAvailable,
    TResult Function(NfcLoading value)? nfcLoading,
    TResult Function(NFCError value)? nfcError,
    TResult Function(NFCState value)? nfcState,
    TResult Function(NFCUseState value)? nfcUseState,
    TResult Function(NFCReadNfc value)? nfcReadNfc,
    required TResult orElse(),
  }) {
    if (nfcReadNfc != null) {
      return nfcReadNfc(this);
    }
    return orElse();
  }
}

abstract class NFCReadNfc implements SocialState {
  const factory NFCReadNfc(final NfcMessage nfcMessage) = _$NFCReadNfcImpl;

  NfcMessage get nfcMessage;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFCReadNfcImplCopyWith<_$NFCReadNfcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
