import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/data/models/company_model.dart";
import "package:halla/core/common/data/models/social_media_model.dart";
import "package:halla/core/common/data/models/time_stamp.g.dart";
import "package:halla/core/common/data/models/user_model.dart";
import "package:halla/core/common/presentation/cubit/user/user_cubit.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/bloc_observer.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/blocs/guest%20cubit/guest_cubit.dart";
import "package:halla/features/auth/presentation/blocs/login%20cubit/login_cubit.dart";
import "package:halla/features/auth/presentation/blocs/nfc%20cubit/nfc_cubit.dart";
import "package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart";
import "package:halla/features/auth/presentation/blocs/social%20cubit/social_cubit.dart";
import "package:halla/features/contacts/data/models/contact_model.dart";
import "package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart";
import "package:halla/features/splash/presentation/bloc/brightness%20cubit/brightness_cubit.dart";
import "package:halla/features/splash/presentation/bloc/language%20cubit/language_cubit.dart";
import "package:halla/features/splash/presentation/screen/splash_screen.dart";
import "package:halla/generated/l10n.dart";
import "package:halla/init_dependencies_map.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bloc
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  // hive
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CompanyModelAdapter());
  Hive.registerAdapter(SocialMediaModelAdapter());
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
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (context) => serviceLocator<ProfileBloc>()),
        // sign in
        BlocProvider(create: (context) => serviceLocator<SignInCubit>()),
        // social
        BlocProvider(create: (context) => serviceLocator<SocialCubit>()),
        // login
        BlocProvider(create: (context) => serviceLocator<LoginCubit>()),
        // nfc
        BlocProvider(create: (context) => serviceLocator<NfcCubit>()),
        // guest
        BlocProvider(create: (context) => serviceLocator<GuestCubit>()),
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
            print(themeMode.name);
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
                    home: SplashScreen());
              },
            );
          },
        ),
      );
}
