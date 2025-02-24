import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/searching/data/searching_data_source.dart';

abstract class SearchingRepo {
  // get user from tag
  Future<Either<Failure, List<User>>> searchUser({required String jobTag});
}

class SearchingRepoImpl extends SearchingRepo {
  final SearchingDataSource searchingDataSource;

  SearchingRepoImpl(this.searchingDataSource);

  @override
  Future<Either<Failure, List<User>>> searchUser(
      {required String jobTag}) async {
    try {
      List<User> users = await searchingDataSource.searchUser(jobTag: jobTag);
      return Right(users);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
