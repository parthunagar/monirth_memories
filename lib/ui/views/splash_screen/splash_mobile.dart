// ignore_for_file: use_build_context_synchronously, unused_element

part of splash_screen_view;
/*

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();
const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'my_channel', // id
  'My Channel', // title
  importance: Importance.high,
);
 */

class _SplashScreenMobile extends StatefulWidget {
  final SplashScreenViewModel viewModel;
  const _SplashScreenMobile(this.viewModel);

  @override
  State<_SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<_SplashScreenMobile> {
  /*
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  NotificationAppLaunchDetails? notificationAppLaunchDetails;
  AndroidInitializationSettings? androidInitializationSettings;
  //IOSInitializationSettings? iosInitializationSettings;
  InitializationSettings? initializationSettings;
  // DashboardProvider? dashboardProvider;

  late String comingData;
  late Map messageComingFromData;
  late Map messageComingFromNotificationData;

  // @override
  // AnalyticsRoute get route => AnalyticsRoute.Splash;

  @override
  void initState() {
    // dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);

    super.initState();
    initializing();

    SharedPreferences.getInstance().then((value) async {
      String? token = await FirebaseMessaging.instance.getToken();
      print('FirebaseMessaging token : $token');
      value.setString(Globals.fireBaseTokes, token ?? '');
    });

    final fbm = FirebaseMessaging.instance;

    fbm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    fbm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   dashboardProvider?.pageNumber=0;
    //   dashboardProvider?.fetchAlertsData(false, Globals.getDateInSeconds(0, true), Globals.getDateInSeconds(0, false));
    //   Map msgData = message.data;
    //   _showNotifications(msgData["title"], msgData["body"]);
    // });

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        final RemoteNotification? notification = message.notification;
        final AndroidNotification? android = notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: 'ic_launcher',
              ),
            ),
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        _showNotifications(notification.title!, notification.body!);
      }
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        _showNotifications(notification.title!, notification.body!);
      } else {
        _showNotifications(notification!.title!, notification.body!);
      }
      // return true;
    });
    Timer(const Duration(seconds: 2), () {
      navigatePage();
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 5),
            // Image.asset(
            //   CustomImages.splash_image,
            //   height: 220,
            //   width: 250,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> navigatePage() async {
    AutoRouter.of(context).replaceNamed('/home');
  }

  /*
  Future<void> navigatePage() async {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardMainScreen2()));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool(Globals.isLoggedIn);
    // bool isLoggedIn = prefs.getBool(Globals.isLoggedIn) ?? false;

    isLoggedIn ??= false;
    if (isLoggedIn) {
      if (prefs.getString(Globals.userRoleName)?.toLowerCase() == "admin") {
        AutoRouter.of(context).replaceNamed('/dashboard');
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const DashBoardView()));
      } else {
        AutoRouter.of(context).replaceNamed('/dashboard');
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const DashBoardView()));
      }
    } else {
      prefs.setBool(Globals.isLoggedIn, false);
      prefs.remove(Globals.mapDataKey);
      AutoRouter.of(context).replace(const LoginRoute());
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (BuildContext context) => const LoginView()));
    }
  }

  void initializing() async {
    androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/app_icon');
    // androidInitializationSettinandroidInitializationSettingsgs = AndroidInitializationSettings(CustomImages.kidMarker);
    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    // iosInitializationSettings = IOSInitializationSettings(
    //     requestAlertPermission: false,
    //     requestBadgePermission: false,
    //     requestSoundPermission: false,
    //     onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
    //       didReceiveLocalNotificationSubject.add(ReceivedNotification(
    //           id: id, title: title ?? '', body: body ?? '', payload: payload ?? ''));
    //     });

    // const MacOSInitializationSettings initializationSettingsMacOS = MacOSInitializationSettings(
    //     requestAlertPermission: false,
    //     requestBadgePermission: false,
    //     requestSoundPermission: false);
    //

    initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings!, onSelectNotification: (String? payload) async {
    //   if (payload != null) {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginScreen(), settings: RouteSettings(name: 'login')));
    //   }
    //   selectNotificationSubject.add(payload ?? '');
    // });
  }

  void _showNotifications(String title, String message) async {
    await notification(title, message);
  }

  Future<void> notification(String title, String message) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Clu', 'Clu',
            priority: Priority.high, importance: Importance.max, ticker: 'Clu');

    widget.viewModel.log
        .i("notification => message || title : $message || $title");
    // IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, title, message, notificationDetails);
  }
 */
}
