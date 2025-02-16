import 'package:fpdart/fpdart.dart';
import 'package:halla/core/ai/data/google_ai_data_source.dart';
import 'package:halla/core/error/failure.dart';

abstract class AIRepo {
  Future<Either<Failure, String>> getTags(String description);
}

class AIRepoImpl extends AIRepo {
  GoogleAiDataSource getGoogleAiDataSource;

  AIRepoImpl(this.getGoogleAiDataSource);

  @override
  Future<Either<Failure, String>> getTags(String description) async {
    try {
      final tags = await getGoogleAiDataSource.getTags(description);
      return Right(tags);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
