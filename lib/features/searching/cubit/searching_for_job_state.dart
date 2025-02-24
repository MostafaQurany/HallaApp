part of 'searching_for_job_cubit.dart';

@freezed
class SearchingForJobState<T> with _$SearchingForJobState<T> {
  const factory SearchingForJobState.initial() = _Initial;

  const factory SearchingForJobState.loading() = Loading;

  const factory SearchingForJobState.loaded(T data) = Loaded;

  const factory SearchingForJobState.error(String message) = Error;
}
