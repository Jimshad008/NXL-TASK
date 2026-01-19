
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxl_task/util/navigation_service.dart';
import 'app/app_router.dart';
import 'app/providers.dart';
import 'app/theme.dart';
import 'core/storage/preference_storage_service.dart';
import 'features/auth/view/splash_page.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp();
  final prefStorage = await PreferenceStorageService.getInstance();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await NotificationService().init();
  runApp(
    ProviderScope(
      overrides: [preferenceStorageProvider.overrideWithValue(prefStorage!)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  Widget build(BuildContext context) {

    final navigationKey = ref.watch(navigationProvider).navigationKey;
    final themeMode = ref.watch(appThemeModeProvider);
    return ScreenUtilInit(
      builder: (context, child) =>MaterialApp(



        title: 'NXL APP',
        //theme: AppTheme.of(context),
        themeMode: themeMode,
        theme: AppTheme().theme,
        // darkTheme: AppDarkTheme().theme,
        // themeMode: ThemeMode.light,
        // home: const LoginPage(),
        builder: (context, widget) {
          final mediaQuery = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQuery.copyWith(textScaler: TextScaler.linear(1.0)),
            child: widget ?? const SizedBox.shrink(),
          );
        },
        home: const SplashPage(),
        // home: const OtpPage(identification: '',),
        // home: const DashBoard(),
        navigatorKey: navigationKey,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
      designSize: Size(360, 756),

    )
    ;
  }
}

