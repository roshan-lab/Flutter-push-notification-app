import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification_app/api/firebase_api.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override

  void initState() {
    FirebaseAPI().isTokenRefresh();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final message=ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Page"),
      ),
      body: Column(
        children: [
          Text(message.notification!.title.toString()),
          Text(message.notification!.body.toString()),
          Text(message.data.toString()),
          Text("UserId is- ${message.data['userid']}"),
          Text("Name is- ${message.data['name']}"),
        ],
      ),
    );
  }



}
