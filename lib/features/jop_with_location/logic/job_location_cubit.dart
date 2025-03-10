import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/features/jop_with_location/repo/jop_location_repo.dart';

part 'job_location_state.dart';

class JobLocationCubit extends Cubit<JobLocationState> {
  final JobLocationRepo jobLocationRepo;

  JobLocationCubit(
    this.jobLocationRepo,
  ) : super(JobLocationInitial());

  // Ensure JobLocationRepo is initialized
  // final JobLocationRepo jobLocationRepo;
  List<User> _cachedUsers = [];

  /// Fetches the current user location.
  void fetchUserCurrentLocation() async {
    emit(GetCurrentLocationLoading());

    final res = await jobLocationRepo.getLocation();
    res.fold(
      (failure) => emit(GetCurrentLocationError(failure.message)),
      (position) => emit(GetCurrentLocationSuccess(position)),
    );
  }

  /// Fetches nearby users based on location and range.
  Future<void> searchNearbyUsers({
    required double latitude,
    required double longitude,
    required double rangeKm,
    required String jobTag,
  }) async {
    emit(SearchNearbyUsersLoading());

    try {
      _cachedUsers.clear();
      print(rangeKm);

      final usersResult = await jobLocationRepo.getNearbyUsers(
        userLat: latitude,
        userLong: longitude,
        range: rangeKm,
        jobTag: jobTag,
      );

      usersResult.fold(
        (failure) {
          emit(SearchNearbyUsersError(failure.message));
        },
        (users) {
          _cachedUsers = users;
          _filterAndEmitUsers(jobTag);
        },
      );
    } catch (e) {
      emit(SearchNearbyUsersError(e.toString()));
    }
  }

  void _filterAndEmitUsers(String jobTag) {
    final filteredUsers = _cachedUsers
        .where((user) => _fuzzyMatch(jobTag, user.jobTitles ?? []))
        .toList();

    emit(SearchNearbyUsersSuccess(filteredUsers));
  }

  bool _fuzzyMatch(String query, List<String> tags) {
    return tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()));
  }
}
