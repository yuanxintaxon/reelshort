import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

import '../../routes/app_navigator.dart';

class DashboardLogic extends GetxController {
  final ssoType = "".obs;

  void viewHome() => AppNavigator.startHome();

  void signIn() => AppNavigator.startLogin();

  void logOut() {
    IMUtils.launchWebpage("https://nodeflair.com/");
  }
}
