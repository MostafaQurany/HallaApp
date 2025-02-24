import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/ai/cubit/ai_cubit.dart";
import "package:halla/core/common/domain/entities/company.dart";
import "package:halla/core/common/domain/entities/contact.dart";
import "package:halla/core/common/domain/entities/social_media.dart";
import "package:halla/core/common/domain/entities/timestamp_adapter.g.dart";
import "package:halla/core/common/domain/entities/user.dart";
import "package:halla/core/common/presentation/cubit/connection/network_cubit.dart";
import "package:halla/core/common/presentation/cubit/user/user_cubit.dart";
import "package:halla/core/di/init_dependencies_map.dart";
import "package:halla/core/native%20contact/cubit/native_contacts_cubit.dart";
import "package:halla/core/notification/cubit/cubit/notification_cubit.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/bloc_observer.dart";
import "package:halla/features/auth/presentation/blocs/guest%20cubit/guest_cubit.dart";
import "package:halla/features/auth/presentation/blocs/login%20cubit/login_cubit.dart";
import "package:halla/features/auth/presentation/blocs/nfc%20cubit/nfc_cubit.dart";
import "package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart";
import "package:halla/features/auth/presentation/blocs/social%20cubit/social_cubit.dart";
import "package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart";
import "package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart";
import "package:halla/features/searching/cubit/searching_for_job_cubit.dart";
import "package:halla/features/splash/presentation/bloc/brightness%20cubit/brightness_cubit.dart";
import "package:halla/features/splash/presentation/bloc/language%20cubit/language_cubit.dart";
import "package:halla/features/splash/presentation/screens/splash_screen.dart";
import "package:halla/generated/l10n.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bloc
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  // hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SocialMediaAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(TimestampAdapter());
  // firebase
  await Firebase.initializeApp();
  // dependencies
  await initDependencies();

  // run
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<UserCubit>()),
        BlocProvider(create: (context) => serviceLocator<BrightnessCubit>()),
        BlocProvider(create: (context) => serviceLocator<LanguageCubit>()),
        BlocProvider(create: (context) => serviceLocator<ProfileBloc>()),
        // sign in
        BlocProvider(create: (context) => serviceLocator<SignInCubit>()),
        //AI
        BlocProvider(create: (context) => serviceLocator<AiCubit>()),
        // social
        BlocProvider(create: (context) => serviceLocator<SocialCubit>()),
        // login
        BlocProvider(create: (context) => serviceLocator<LoginCubit>()),
        // nfc
        BlocProvider(create: (context) => serviceLocator<NfcCubit>()),
        // guest
        BlocProvider(create: (context) => serviceLocator<GuestCubit>()),
        // contacts
        BlocProvider(create: (context) => serviceLocator<ContactCubit>()),
        // connection
        BlocProvider(create: (context) => serviceLocator<NetworkCubit>()),
        // notification
        BlocProvider(create: (context) => serviceLocator<NotificationCubit>()),
        // local notifications
        BlocProvider(
          create: (context) => serviceLocator<NativeContactsCubit>(),
        ),
        //search for job
        BlocProvider(
          create: (context) => serviceLocator<SearchingForJobCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        designSize: const Size(390, 679),
        builder: (_, Widget? child) => BlocBuilder<BrightnessCubit, ThemeMode>(
          builder: (context, themeMode) {
            return BlocBuilder<LanguageCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Halla",
                  locale: locale,
                  localizationsDelegates: const <LocalizationsDelegate>[
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  themeMode: themeMode,
                  theme: themeMode == ThemeMode.light
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme,
                  home: SplashScreen(),
                );
              },
            );
          },
        ),
      );
}
