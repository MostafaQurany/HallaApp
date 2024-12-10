part of 'init_dependencies_map.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // core
  _initCommon();

  // featuers
  _initAuth();

  // contacts

  await _initContact();

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
      () => LogInWithEmailPasswordUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GoogleLoginUseCase(
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
    ..registerFactory(
      () => GetPhoneAuthCredentials(
        authRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => LinkPhoneWithPhoneAuthCredentialUseCase(
        authRepository: serviceLocator(),
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
      ),
    )
    ..registerLazySingleton(
      () => SignInCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SocialCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => LoginCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => NfcCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => GuestCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

_initContact() async {
  await Hive.openBox<List<Contact>>(AppConstants.contactBox);
  serviceLocator
    // Data Source
    ..registerFactory<ContactsDataSource>(
      () => ContactsDataSourceNewImpl(),
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
      () => AddContactListUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddContactUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteContactUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetContactListSyncUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetContactListUseCase(
        serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => ContactCubit(
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
