import 'package:flutter/material.dart';
import 'package:preload_video/bean/load_state.dart';
import 'package:preload_video/bean/video_vo.dart';

typedef ItemPanBuilder = Widget Function(int index);

abstract class BaseVideoItem<T extends VideoVo> extends StatefulWidget {


  final ItemPanBuilder? buildPan;
  final Future<ServicePlayStateVo> Function(T item)? getPlayUrlService;
  final Widget? needVipBuild;
  final Widget? needPurchaseBuild;
  final Widget? needAdvBuild;

  final Widget? gettingPlayUrlBuild;
  final Widget? getErrorPlayUrlBuild;

   BaseVideoItem(
      {super.key,
      this.buildPan,
      this.getPlayUrlService,
      this.needVipBuild,
      this.needPurchaseBuild,
      this.needAdvBuild,
      this.gettingPlayUrlBuild,
      this.getErrorPlayUrlBuild}){

     print('船只类型${buildPan?.runtimeType}');
  }
}
