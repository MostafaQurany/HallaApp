part of 'job_location_cubit.dart';

@immutable
sealed class JobLocationState {}

final class JobLocationInitial extends JobLocationState {}

final class GetCurrentLocationSuccess extends JobLocationState {
  final Position position;

  GetCurrentLocationSuccess({required this.position});
}

final class GetCurrentLocationError extends JobLocationState {
  final String error;

  GetCurrentLocationError({required this.error});
}

final class GetCurrentLocationLoading extends JobLocationState {}
