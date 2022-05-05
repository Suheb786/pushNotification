import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/pushNotification/pushNotification_controller.dart';

import 'app/modules/localNotification/local_notification.dart';
import 'app/routes/app_pages.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint("onBackgroundMessageHandler called");
  // LocalNotificationService.createanddisplaynotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(PushNotificationController());
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  //* Get device token :

  // final token = await FirebaseMessaging.instance.getToken();
  // print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FluRtter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.HOME,
    );
  }
}
