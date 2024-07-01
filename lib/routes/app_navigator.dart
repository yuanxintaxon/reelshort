import 'package:get/get.dart';

import 'app_pages.dart';

class AppNavigator {
  AppNavigator._();

  static startWelcomeOffAndToNamed() =>
      Get.rootDelegate.offAndToNamed(AppRoutes.welcome);

  static void startWelcomeBackUntil() {
    Get.rootDelegate.backUntil(AppRoutes.welcome);
  }

  static startWelcome() => Get.rootDelegate.toNamed(AppRoutes.welcome);
}
