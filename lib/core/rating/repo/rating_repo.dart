import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/rating/data/rating_data_source.dart';
import 'package:halla/core/rating/entities/rating.dart';

abstract class RatingRepo {
  // add Rating to the user
  Future<Either<Failure, void>> addRatingToUser(
    String userId,
    UserRating userRating,
  );

  // get the rating of the user
  Future<Either<Failure, Rating>> getRatingFromUser(String userId);

  // delete the rating of the user
  Future<Either<Failure, void>> deleteRatingFromUser(String userId);
}

class RatingRepoImpl extends RatingRepo {
  RatingDataSource ratingDataSource;

  RatingRepoImpl(this.ratingDataSource);

  @override
  Future<Either<Failure, void>> addRatingToUser(
    String userId,
    UserRating userRating,
  ) async {
    try {
      final res = await ratingDataSource.addRatingToUser(userId, userRating);
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRatingFromUser(String userId) async {
    try {
      final res = await ratingDataSource.deleteRatingFromUser(userId);
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Rating>> getRatingFromUser(String userId) async {
    try {
      final res = await ratingDataSource.getRatingFromUser(userId);
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
