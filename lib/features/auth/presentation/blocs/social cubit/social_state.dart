part of 'social_cubit.dart';

@freezed
class SocialState with _$SocialState {
  const factory SocialState.initial() = _Initial;

  // google states success , loading and error
  const factory SocialState.googleLoading() = GoogleLoading;

  const factory SocialState.googleSuccess(Map<String, dynamic> userState) =
      GoogleSuccess;

  const factory SocialState.googleError(String errorMessage) = GoogleError;

  // facebook states success , loading and error
  const factory SocialState.facebookLoading() = FacebookLoading;

  const factory SocialState.facebookSuccess(Map<String, dynamic> userState) =
      FacebookSuccess;

  const factory SocialState.facebookError(String errorMessage) = FacebookError;
}
