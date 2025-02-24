import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../core/common/domain/entities/user.dart';

abstract class SearchingDataSource {
  // searching

  Future<List<User>> searchUser({required String jobTag});
}

class SearchingDataSourceImpl extends SearchingDataSource {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<User>> searchUser({required String jobTag}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
          .collection(AppConstants.userCollection)
          .get(GetOptions(
            source: Source.serverAndCache,
          )); // Fetch all users

      List<User> users = [];
      for (var doc in querySnapshot.docs) {
        User user = User.fromMap(doc.data());
        if (user.jobTitles != null && user.jobTitles!.isNotEmpty) {
          for (String tag in user.jobTitles ?? []) {
            double similarity = tag.similarityTo(jobTag); // Compare words
            if (similarity > 0.3) {
              users.add(user);
              break;
            }
          }
        }
      }
      return users;
    } catch (e) {
      throw e.toString();
    }
  }
}
