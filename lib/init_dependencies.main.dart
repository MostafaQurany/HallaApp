import 'package:get_it/get_it.dart';
import 'package:halla/core/common/presentation/cubit/user_cubit.dart';
import 'package:halla/features/auth/data/data_sources/auth_data_source.dart';
import 'package:halla/features/auth/data/data_sources/data_base_source.dart';
import 'package:halla/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sent_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:halla/features/auth/domain/usecases/upload_user_usecase.dart';
import 'package:halla/features/auth/presentation/blocs/auth bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  // core
  serviceLocator.registerLazySingleton(
    () => UserCubit(),
  );
}

_initAuth() {
  serviceLocator
    // Data Source
    ..registerFactory<AuthDataSource>(
      () => AuthDataSourceImpl(),
    )
    ..registerFactory<DataBaseSource>(
      () => DataBaseSourceImpl(),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // UseCase
    ..registerFactory(
      () => SignInWithEmailPasswordUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetSmsCodeUsecase(
        authRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SentSmsCodeUsecase(
        authRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetUserUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UploadUserUsecase(
        serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userCubit: serviceLocator(),
        signInWithEmailPassword: serviceLocator(),
        getSmsCodeUsecase: serviceLocator(),
        sentSmsCodeUsecase: serviceLocator(),
        getUserUsecase: serviceLocator(),
        uploadUserUsecase: serviceLocator(),
      ),
    );
}
