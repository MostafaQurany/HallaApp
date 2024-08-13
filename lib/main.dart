import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/domain/entities/company.dart";
import "package:halla/core/common/domain/entities/social_media.dart";
import "package:halla/features/contacts/presentation/screens/contact_details_screen.dart";
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import "package:halla/core/common/data/models/company_model.dart";
import "package:halla/core/common/data/models/social_media_model.dart";
import "package:halla/core/common/data/models/time_stamp.g.dart";
import "package:halla/core/common/presentation/cubit/theme/cubit/brightness_cubit.dart";
import "package:halla/core/common/presentation/cubit/user/user_cubit.dart";
import "package:halla/core/constants/constants.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/bloc_observer.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/auth_screen.dart";
import "package:halla/features/contacts/data/models/contact_model.dart";
import "package:halla/features/contacts/domain/entities/contact.dart";
import "package:halla/features/contacts/presentation/blocs/bloc/contacts_bloc.dart";
import "package:halla/features/home/presentation/screens/home_layout.dart";
import "package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart";

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
    storageDirectory: await getTemporaryDirectory(),
  );
  // hive
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
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
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (context) => serviceLocator<ContactsBloc>()),
        BlocProvider(create: (context) => serviceLocator<ProfileBloc>()),
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
        builder: (_, Widget? child) => BlocBuilder<BrightnessCubit, Brightness>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Halla",
              locale: const Locale("en"),
              localizationsDelegates: const <LocalizationsDelegate>[
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                RefreshLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: state == Brightness.light
                  ? AppTheme.darkTheme
                  : AppTheme.lightTheme,
              themeMode:
                  state == Brightness.light ? ThemeMode.light : ThemeMode.dark,
              home: ContactDetailsScreen(
                contact: Contact(
                  id: "12365",
                  fullName: "asdasdasd",
                  primePhone: "01015089201",
                  phones: [
                    '01156065655',
                    '01156065655',
                    '01156065655',
                  ],
                  nationality: "Egyption",
                  dateOfBirth: "19/2/2022",
                  socialMedia: SocialMedia(
                    facebook: "facebook",
                    instagram: "instagram",
                    linkedin: 'linkedin',
                    twitter: 'twitter',
                  ),
                  company: Company(
                    name: "name",
                    phoneNumber: "phoneNumber",
                    website: 'website',
                    position: 'position',
                  ),
                  addTime: Timestamp.now(),
                ),
              ),
            );
          },
        ),
      );
}
