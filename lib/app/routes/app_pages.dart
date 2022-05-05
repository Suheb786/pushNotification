import 'package:get/get.dart';

import '../modules/pushNotification/pushNotification_binding.dart';
import '../modules/pushNotification/pushNotification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.PUSH_NOTIFICATION,
      page: () => PushNotification(),
      binding: HomeBinding(),
    ),
  ];
}
