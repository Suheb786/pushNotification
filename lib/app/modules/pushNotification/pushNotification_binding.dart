import 'package:get/get.dart';

import 'pushNotification_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PushNotificationController>(
      () => PushNotificationController(),
    );
  }
}
