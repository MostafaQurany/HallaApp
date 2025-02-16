import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/rating/entities/rating.dart';

abstract class RatingDataSource {
  // add Rating to the user
  Future<void> addRatingToUser(
    String userId,
    UserRating userRating,
  );

  // get the rating of the user
  Future<Rating> getRatingFromUser(String userId);

  // delete the rating of the user
  Future<void> deleteRatingFromUser(String userId);
}

class RatingDataSourceImpl extends RatingDataSource {
  final fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addRatingToUser(String userId, UserRating userRating) async {
    try {
      await fireStore
          .collection(AppConstants.ratingUserCollection)
          .doc(userId)
          .update({
        'usersRates': FieldValue.arrayUnion(
          [
            userRating.toJson(),
          ],
        ),
      });
    } catch (e) {
      throw 'Failed to add rating to user: $e';
    }
  }

  @override
  Future<Rating> getRatingFromUser(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await fireStore
          .collection(AppConstants.ratingUserCollection)
          .doc(userId)
          .get();
      return Rating.fromJson(doc.data() ?? {});
    } catch (e) {
      throw 'Failed to get rating to user: $e';
    }
  }

  @override
  Future<void> deleteRatingFromUser(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await fireStore
          .collection(AppConstants.ratingUserCollection)
          .doc(userId)
          .get();
      Rating rating = Rating.fromJson(doc.data() ?? {});
      rating.usersRates.removeWhere((element) => element.userId == userId);
      await fireStore
          .collection(AppConstants.ratingUserCollection)
          .doc(userId)
          .update({
        'usersRates': rating.usersRates,
      });
    } catch (e) {
      throw 'Failed to delete rating from user: $e';
    }
  }
}
