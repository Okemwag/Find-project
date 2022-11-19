import 'package:camera/camera.dart';
import 'package:find_my_id/chopper_api/my_api_services.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/decor/text_styles.dart';
import 'package:find_my_id/notifiers/photo_notifier.dart';
import 'package:find_my_id/routes/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;

FirebaseMessaging messaging = FirebaseMessaging.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _requestNotificationsPermissions();

  //Handling background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  cameras = await availableCameras();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => MyApiService.create()),
        ChangeNotifierProvider<PhotosNotifier>(
          create: (_) => PhotosNotifier(),
          lazy: true,
        ),
      ],
      builder: (context, child) {
        return Builder(
          builder: (context) {
            return const MyApp();
          },
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fInD',
      initialRoute: RouteManager.splash,
      onGenerateRoute: RouteManager.generateRoute,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: genTxt,
        ),
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(8.0),
            foregroundColor: Colors.white60,
            backgroundColor: colorPrimaryVariant,
            elevation: 3.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorWhiteBackground,
          foregroundColor: colorPrimary,
        ),
        scaffoldBackgroundColor: colorBackground,
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  //TODO: Open ID to be viewed
  print(message.messageId);
}

void _requestNotificationsPermissions() async {
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}
