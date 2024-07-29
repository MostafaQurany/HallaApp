part of 'init_dependencies_map.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // core
  _initCommon();

  // featuers
  _initAuth();

  _initContact();
}

_initCommon() {
  serviceLocator
    // Data Source
    ..registerLazySingleton<NfcDataSource>(
      () => NfcDataSourceImpl(),
    )
    // Repository
    ..registerFactory<CommonRepositories>(
      () => CommonRepositoriesImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // UseCase
    ..registerFactory(
      () => GetIsNfcAvailableUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetIsNfcOpenUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => WriteOnNfcUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ReadFromNfc(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => LogInGuest(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetGuest(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => IsGuestUpdate(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => IsGuestExit(
        serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => UserCubit(),
    )
    ..registerLazySingleton(
      () => BrightnessCubit(),
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
    ..registerFactory(
      () => LogInWithEmailPassword(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GoogleLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => LinkWithEmailPincode(
        serviceLocator(),
      ),
    )

    // bloc
    ..registerLazySingleton(
      () => AuthBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

_initContact() {
  serviceLocator
    // Data Source
    ..registerFactory<ContactsDataSource>(
      () => ContactsDataSourceImpl(),
    )
    ..registerFactory<ContactsLocalDataSource>(
      () => ContactsLocalDataSourceImpl(),
    )
    // Repository
    ..registerFactory<ContactsRepository>(
      () => ContactsRepositoryImpl(
        serviceLocator(),
      ),
    )
    // UseCase

    // bloc
    ..registerLazySingleton(
      () => ContactsBloc(),
    );
}
