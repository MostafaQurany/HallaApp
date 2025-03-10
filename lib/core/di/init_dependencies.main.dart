part of 'init_dependencies_map.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCommon();

  _initAuth();

  await _initContact();

  _initProfile();

  _notification();

  _nativeContact();

  _ai();

  _search();

  _jobLocation();
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
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => BrightnessCubit(),
    )
    ..registerLazySingleton(
      () => LanguageCubit(),
    )
    ..registerLazySingleton(
      () => NetworkCubit(
        serviceLocator(),
      ),
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
  await Hive.openBox<List>(AppConstants.contactBox);
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
    ..registerFactory(
      () => GetOfflineListContactUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddOfflineContactUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ClearOfflineContactUseCase(
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

_notification() {
  serviceLocator
    ..registerFactory<NotificationDatabase>(
      () => NotificationDatabaseImpl(),
    ) // Repository
    ..registerFactory<NotificationRepository>(
      () => NotificationRepositoriesImp(
        serviceLocator(),
      ),
    ) // bloc
    ..registerLazySingleton(
      () => NotificationCubit(
        serviceLocator(),
      ),
    );
}

_nativeContact() {
  serviceLocator
    // dataSource
    ..registerLazySingleton<NativeLocalContactDataBaseSource>(
      () => NativeLocalContactDataBaseSourceImpl(),
    )
    //repository
    ..registerFactory<NativeContactsRepository>(
      () => NativeContactsRepositoryImpl(serviceLocator()),
    )
    // bloc
    ..registerFactory(
      () => NativeContactsCubit(serviceLocator()),
    );
}

_ai() {
  // data source
  serviceLocator
    ..registerFactory<GoogleAiDataSource>(
      () => GoogleAiDataSourceImpl(),
    ) // repo
    ..registerFactory<AIRepo>(
      () => AIRepoImpl(serviceLocator()),
    ) // bloc
    ..registerLazySingleton(
      () => AiCubit(serviceLocator()),
    );
}

_search() {
  serviceLocator
    ..registerFactory<SearchingDataSource>(
      () => SearchingDataSourceImpl(),
    ) // repo
    ..registerFactory<SearchingRepo>(
      () => SearchingRepoImpl(serviceLocator()),
    ) // bloc
    ..registerLazySingleton(
      () => SearchingForJobCubit(serviceLocator()),
    );
}

_jobLocation() {
  serviceLocator
    ..registerFactory<JobLocationDataSource>(
      () => JobLocationDataSourceImpl(),
    ) // repo
    ..registerFactory<JobLocationRepo>(
      () => JopLocationRepoImpl(jobLocationDataSource: serviceLocator()),
    ) // bloc
    ..registerLazySingleton(
      () => JobLocationCubit(serviceLocator()),
    );
}
