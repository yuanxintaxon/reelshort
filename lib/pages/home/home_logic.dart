import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reelshort/routes/app_navigator.dart';
import 'package:resource_common/resource_common.dart';

class HomeLogic extends GetxController {
  final activeIndex = 0.obs;

  final continueWatchingCtrl = ScrollController();
  final topPickCtrl = ScrollController();
  final newReleaseCtrl = ScrollController();
  final hiddenIdentityCtrl = ScrollController();
  final loveAtFirstSightCtrl = ScrollController();
  final youngLoveCtrl = ScrollController();
  final toxicNTabooCtrl = ScrollController();
  final werewolfNVampireCtrl = ScrollController();
  final asianStoriesCtrl = ScrollController();

  @override
  void onClose() {
    continueWatchingCtrl.dispose();
    topPickCtrl.dispose();
    newReleaseCtrl.dispose();
    hiddenIdentityCtrl.dispose();
    loveAtFirstSightCtrl.dispose();
    youngLoveCtrl.dispose();
    toxicNTabooCtrl.dispose();
    werewolfNVampireCtrl.dispose();
    asianStoriesCtrl.dispose();
    super.onClose();
  }
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

  void viewProfile() => AppNavigator.startDashboard();
}
