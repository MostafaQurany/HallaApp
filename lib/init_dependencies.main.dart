part of 'init_dependencies_map.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // core
  _initCommon();

  // featuers
  _initAuth();

  _initContact();

  _initProfile();
}

_initCommon() {
  serviceLocator
    // Data Source
    ..registerLazySingleton<NfcDataSource>(
      () => NfcDataSourceImpl(),
    )
    ..registerLazySingleton<LocalUserDataSource>(
      () => LocalUserDataSourceImpl(),
    )
    ..registerLazySingleton<NativeLocalContactDataBaseSource>(
      () => NativeLocalContactDataBaseSourceImpl(),
    )
    // Repository
    ..registerFactory<CommonRepositories>(
      () => CommonRepositoriesImpl(
        serviceLocator(),
        serviceLocator(),
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
    ..registerFactory(
      () => ForgetPinCodeGuestUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddUserToLocalUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetUserFromLocalUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => IsUserSavedLocalUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteUserFromLocalUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetFirstTimeLocalContactsUsecase(
        serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => UserCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => BrightnessCubit(),
    )
    ..registerLazySingleton(
      () => LanguageCubit(),
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
      () => LogInWithPhoneUseCase(
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
    ..registerFactory(
      () => ForgetPasswordUsecase(
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
        serviceLocator(),
      ),
    )
    // UseCase
    ..registerFactory(
      () => AddContactListServerUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddContactServerUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteContactServerUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetBoxListenableUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetContactListLocalUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetContactLocalUseCase(
        serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => ContactsBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

_initProfile() {
  serviceLocator
    // Data Source
    ..registerFactory<ProfileDataSource>(
      () => ProfileDataSourceImpl(),
    )

    // Repository
    ..registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(
        serviceLocator(),
      ),
    )
    // UseCase
    ..registerFactory(
      () => SetImageUrlUsecase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetImageUrlUsecase(
        serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => ProfileBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}
