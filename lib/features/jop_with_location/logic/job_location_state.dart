part of 'job_location_cubit.dart';

abstract class JobLocationState {}

class JobLocationInitial extends JobLocationState {}

class GetCurrentLocationLoading extends JobLocationState {}

class GetCurrentLocationSuccess extends JobLocationState {
  final Position position;

  GetCurrentLocationSuccess(this.position);
}

class GetCurrentLocationError extends JobLocationState {
  final String error;

  GetCurrentLocationError(this.error);
}

class SearchNearbyUsersLoading extends JobLocationState {}

class SearchNearbyUsersSuccess extends JobLocationState {
  final List<User> users;

  SearchNearbyUsersSuccess(this.users);
}

class SearchNearbyUsersError extends JobLocationState {
  final String error;

  SearchNearbyUsersError(this.error);
}
