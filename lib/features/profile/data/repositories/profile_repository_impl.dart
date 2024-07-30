import 'package:halla/features/profile/data/data_sources/profile_data_source.dart';
import 'package:halla/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource profileDataSource;
  ProfileRepositoryImpl(this.profileDataSource);
}

