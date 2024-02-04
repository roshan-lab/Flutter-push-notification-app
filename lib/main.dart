import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification_app/api/firebase_api.dart';
import 'package:pushnotification_app/firebase_options.dart';
import 'package:pushnotification_app/pages/homePage.dart';
import 'package:pushnotification_app/pages/notificationPage.dart';



final navigateKey=GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      navigatorKey: navigateKey,
      routes: {
        "/notification_screen":(context)=>const NotificationPage()
      },
    );
  }
}
