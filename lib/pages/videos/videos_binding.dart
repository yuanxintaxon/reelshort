import 'package:get/get.dart';

import 'videos_logic.dart';

class VideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideosLogic());
  }
}
