import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home"),
    );
  }
}
