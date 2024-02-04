import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notificationMsg();
          },
          child: Text("Send"),
        ),
      ),
    );
  }

  Future<dynamic> notificationMsg() async {
    var headers = {
      'Authorization':
          'key=AAAANG6WuYU:APA91bFVYMXey0PKFNbV_U8Lp0CrzSgsFPvDR5B-4D4_s7FAY_SgSJhKy22hLKtXiYtbP1YUOt3mRsGd2GdX9cnfXkt-eWlqC0FQXPzQjyvrCjL0TaGZpKjatBvBB8RxbZMqOQQP5eiP',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "registration_ids": [
        "d4O1QFEgSPyBHyUHUZmSas:APA91bE4EMIuiFcT-_oOiC11Gakapna3h6wJ_VsUJV-ZCzGq5CEtVh7ldhjWWr5ul3JN0pszoSc2ZymkVfeDOW4Oidv-RGicW2jqks30emFfoAmNntx7vBL844eLY0QVbcpUixEnN0Zh",
        "cP88kPgyTtCwoizGbJ1eq_:APA91bGQX_PCdzW0xGjN7_jPPRbpgV3ZqDXxtXADoJx5-QQaGzcFFoUVG9Z_3RMwR53rRfI4aXFj4XQWdK0cCmzrIPMr-13Y0pyulo2MvVjddGjeqQeare-1wQuF7s0Ts7HRx-wklpL8"
      ],
      "notification": {
        "title": "Notification by postman",
        "body": "This is sent from postman"
      },
      "data": {"type": "msg", "userid": "006211", "name": "Roshan Sharma"}
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var respo = await http.Response.fromStream(response);
      setState(() {
        print("Response is ${respo.body}");
      });
    }
  }
}
