import 'package:monirth_memories/core/app_observer.dart';
import 'package:monirth_memories/core/auto_route_guards.dart';
import 'package:monirth_memories/firebase_options.dart';
import 'package:monirth_memories/utils/router_aware_analytics.dart';
import 'package:monirth_memories/utils/style.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'core/route/router.gr.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

// var appCheck = FirebaseAppCheck.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    name: 'com.example.monirth_memories',
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,

    ///
    /// generate from firebase console
    /// appcheck -> apps tab -> click three dots on cardmaker -> manage debug tokens
    /// https://firebase.google.com/docs/app-check/flutter/debug-provider
    ///
    webProvider: ReCaptchaV3Provider('452759EE-30D6-4586-A84C-28F1F05842D5'),
    // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  );
  await FirebaseAppCheck.instance.activate();
  await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
  // await FirebaseAppCheck.instance.getLimitedUseToken();
  // await appCheck.setTokenAutoRefreshEnabled(true);
  // await appCheck.getToken(true);
  // await setupLocator(); 

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = AppObserver(analytics: analytics);
  // static final navKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // final SharedPreferencesService sharedPreferences = locator<SharedPreferencesService>();

  final _appRouter = AppRouter(
    notAuthGuard: NotAuthGuard(),
    navigatorKey: StackedService.navigatorKey, //MyApp.navKey,
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return MaterialApp.router(
          title: "Marrige Photo",
          debugShowCheckedModeBanner: false,
          theme: AppStyle.angloLightTheme,
          darkTheme: AppStyle.angloLightTheme,
          themeMode: ThemeMode.light,
          routeInformationParser:
              _appRouter.defaultRouteParser(includePrefixMatches: true),
          // routerDelegate: AppRouter().delegate(),
          routerDelegate: _appRouter.delegate(
            navigatorObservers: () => [routeObserver, MyApp.observer],
          ),
          // routeInformationProvider: _appRouter.delegate(
          //   navigatorObservers: () => [routeObserver, MyApp.observer],
          // ),
        );
      },
    );
  }
}
