import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halla/features/jop%20with%20location/repo/jop_location_repo.dart';
import 'package:meta/meta.dart';

part 'job_location_state.dart';

class JobLocationCubit extends Cubit<JobLocationState> {
  final JobLocationRepo jobLocationRepo;

  JobLocationCubit(this.jobLocationRepo) : super(JobLocationInitial());

  void fetchUserCurrentLocation() async {
    emit(GetCurrentLocationLoading());
    final res = await jobLocationRepo.getLocation();
    res.fold(
      (l) {
        emit(GetCurrentLocationError(error: l.message));
      },
      (r) {
        emit(GetCurrentLocationSuccess(position: r));
      },
    );
  }
}
