import 'package:get/get.dart';
import 'package:reelshort/routes/app_navigator.dart';
import 'package:resource_common/resource_common.dart';

class HomeLogic extends GetxController {
  final activeIndex = 0.obs;

  @override
  void onInit() {
    Logger.print("creturn home init");
    super.onInit();
  }

  @override
  void onReady() {
    super.onInit();
  }

  void updateIndex(int index) {
    activeIndex.value = index;
  }

  void startVideos() => AppNavigator.startVideos();
}
