import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'videos_logic.dart';

class VideosPage extends StatelessWidget {
  final logic = Get.find<VideosLogic>();

  VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Welcome"),
    );
  }
}
