import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<http.Response> sendCallNotification(
    String peerToken, String content) async {
  debugPrint("send notification call");
  final body = jsonEncode(
    {
      "to": peerToken,
      "priority": "high",
      "data": {
        "id": "12345",
        "payload": "This is payload",
      },
      "notification": {
        "vibrate": "300",
        "priority": "high",
        "image":
            "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",
        "body": content,
        "title": "Test with the S10 application",
        "sound": "custom.mp3",
        "android_channel_id":
            "pushnotificationapp" /* android's sound is set within the app using notification channels */
      }
    },
  );

  final response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          "key=AAAAJpEcLjY:APA91bHXkx2vrKIxgQVE9og-6huoyv5aIPuwRprDU5dXec5IJEUqCto5r1spNPJjlQbJdwLVmFJmD_2qPeGsGsLZycrQUAUiOEcNHMulFJiMok5HaXrvbFtS8nYg9QzPgt206oiXLc78"
    },
    body: body,
  );
  debugPrint("send notifications is ${body.toString()}");
  return response;
}
