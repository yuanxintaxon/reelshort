import 'package:get/get.dart';
import 'package:reelshort/routes/app_navigator.dart';
import 'package:resource_common/resource_common.dart';

import 'dart:html' as html;

class HomeLogic extends GetxController {
  final activeIndex = 0.obs;
  @override
  void onReady() {
    // autoJump();
    super.onInit();
  }

  void autoJump() async {
    await Future.delayed(2.seconds);
    html.window.history.replaceState(null, 'title', '/test');
  }

  void updateIndex(int index) {
    activeIndex.value = index;
  }

  void startVideos() => AppNavigator.startVideos();
}
