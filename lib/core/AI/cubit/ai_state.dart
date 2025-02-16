part of 'ai_cubit.dart';

@freezed
class AiState<T> with _$AiState<T> {
  const factory AiState.initial() = _Initial;

  const factory AiState.loading() = Loading;

  const factory AiState.loaded(T data) = Loaded;

  const factory AiState.error(String message) = Error;
}
