import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class LinkWithEmailPincode implements UseCase<void, LinkWithEmailPincodePeram> {
  final AuthRepository authRepository;

  LinkWithEmailPincode(this.authRepository);

  @override
  Future<Either<Failure, void>> call(LinkWithEmailPincodePeram params) async {
    return await authRepository.linkWlinkWithEmailPassword(params.user);
  }
}

class LinkWithEmailPincodePeram {
  final User user;

  LinkWithEmailPincodePeram({required this.user});
}
