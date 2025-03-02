import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/jop%20with%20location/data/jop_location_data_source.dart';

abstract class JobLocationRepo {
  // get the location
  Future<Either<Failure, Position>> getLocation();
}

class JopLocationRepoImpl implements JobLocationRepo {
  final JobLocationDataSource jobLocationDataSource;

  JopLocationRepoImpl({required this.jobLocationDataSource});

  @override
  Future<Either<Failure, Position>> getLocation() async {
    try {
      final res = await jobLocationDataSource.getCurrentLocation();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
