import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../localNotification/local_notification.dart';

class PushNotificationController extends GetxController {
  @override
  void onInit() {
    //* 1. This method call when app in terminated state and you get a notification
    //* when you click on notification app open from terminated state and you can get notification data in this method
    super.onInit();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        debugPrint("getInitialState listener triggered");
        if (message != null) {
          // msg.value =
          // "Pushed when app was termineted Payload : ${message.data['payload']}";
          // Get.toNamed(Routes.pushNotification);
        }
      },
    );

    //* 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        // print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          debugPrint(
              "onMessage listener triggered ${message.notification!.android!.toString()}");
          // msg.value =
          // "Pushed on forground state Payload : ${message.data['payload']}";

          // Get.toNamed(Routes.pushNotification);
          // print(message.notification!.title);
          // print(message.notification!.body);
          // print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    //* 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        // LocalNotificationService.createanddisplaynotification(message);
        // print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          debugPrint("onMessageOpendApp listener triggered");
          // msg.value =
          // "Pushed by notification when app was running in background Payload : ${message.data['payload']}";

          // Get.toNamed(Routes.pushNotification);
          // print(message.notification!.title);
          // print(message.notification!.body);
          // print("message.data22 ${message.data['_id']}");

        }
      },
    );
  }
}
