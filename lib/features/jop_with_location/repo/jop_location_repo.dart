import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/jop_with_location/data/jop_location_data_source.dart';

abstract class JobLocationRepo {
  // get the location
  Future<Either<Failure, Position>> getLocation();

  Future<Either<Failure, List<User>>> getNearbyUsers({
    required double userLat,
    required double userLong,
    required double range,
    required String jobTag,
  });
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

  @override
  Future<Either<Failure, List<User>>> getNearbyUsers(
      {required double userLat,
      required double userLong,
      required double range,
      required String jobTag}) async {
    try {
      final res = await jobLocationDataSource.getNearbyUsers(
        userLat: userLat,
        userLong: userLong,
        range: range,
        jobTag: jobTag,
      );
      List<User> users = res.map((e) => User.fromMap(e)).toList();
      return Right(users);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
