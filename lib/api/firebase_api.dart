import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pushnotification_app/main.dart';


class FirebaseAPI{
  /// Create an instance of firebase messaging
  final _firebaseMessaging =FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  // function to initialize notification
Future<void> initNotification() async{
  await _firebaseMessaging.requestPermission();
  final fcmToken=await _firebaseMessaging.getToken();
  print("Token : $fcmToken");
  initPushNotifications();
}


/// Function to handle received Msg
void handleMessage(RemoteMessage? message){
  if(message==null) return;
  navigateKey.currentState?.pushNamed(
    '/notification_screen',
    arguments: message,
  );
}


/// save token
  void saveToken(String token)async{
  await FirebaseFirestore.instance.collection("UserTokens").doc("User2").set({
    'token': token
  } );
  }

  isTokenRefresh(){
  _firebaseMessaging.onTokenRefresh.listen((event) {
    event.toString();
    print("Token is refresh");
  });
  }

/// Function to handle background settings
Future initPushNotifications()async {
  // if app was terminated
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onMessage.listen(handleMessage);
}
}