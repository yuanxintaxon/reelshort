import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'welcome_logic.dart';

class WelcomePage extends StatelessWidget {
  final logic = Get.find<WelcomeLogic>();

  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Welcome"),
    );
  }
}
