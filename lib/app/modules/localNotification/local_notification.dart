import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // static void initialize(BuildContext context) {
  static void initialize() {
    // initializationSettings  for Android
    // const InitializationSettings initializationSettings =
    //     InitializationSettings(
    //   android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    // );
    _notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      ),
      onSelectNotification: (String? id) async {
        debugPrint("onSelectNotification");
        debugPrint("Value of Id : $id");
        if (id!.isNotEmpty) {
          debugPrint("Payload : $id");
          // Get.toNamed(Routes.pushNotification);
          // print("Router Value1234 $id");

          //  Get.toNamed(Routes.pushNotification);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => DemoScreen(
          //       id: id,
          //     ),
          //   ),
          // );

        }
      },
    );
  }

  static Future<String> _base64encodedImage(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    final String base64Data = base64Encode(response.bodyBytes);
    return base64Data;
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    // print("Notification Message : ${message.notification!.android!.imageUrl.toString()}");

    final String largeIcon =
        await _base64encodedImage('https://picsum.photos/48/48');
    final String bigPicture = await _base64encodedImage(
        message.notification!.android!.imageUrl.toString());

    try {
      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(
          bigPicture,
        ), //Base64AndroidBitmap(bigPicture),
        largeIcon: ByteArrayAndroidBitmap.fromBase64String(largeIcon),
        contentTitle: message.notification?.title,
        htmlFormatContentTitle: true,
        summaryText: message.notification?.body,
        htmlFormatSummaryText: true,
      );

      final androidNotificationDetails = AndroidNotificationDetails(
        "pushnotificationapp",
        "pushnotificationappchannel",
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: bigPictureStyleInformation,
      );

      await _notificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: androidNotificationDetails,
        ),
        payload: message.data['id'],
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
