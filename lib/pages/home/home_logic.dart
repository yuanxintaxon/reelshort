import 'package:get/get.dart';

class HomeLogic extends GetxController {
  final activeIndex = 0.obs;

  void updateIndex(int index) {
    activeIndex.value = index;
  }
}
