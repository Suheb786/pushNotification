import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'pushNotification_controller.dart';

class PushNotification extends GetView<PushNotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
