import 'package:get/get.dart';

import '../../routes/app_navigator.dart';

class DashboardLogic extends GetxController {
  final ssoType = "".obs;
  void viewHome() => AppNavigator.startHome();
}
