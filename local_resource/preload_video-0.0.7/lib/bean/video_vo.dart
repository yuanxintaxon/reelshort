
import 'package:flutter/material.dart';

///视频基础信息类
///子类反序列化时，必须为此类的所有属性赋值
abstract class VideoVo{

  ///当前播放的视频进度
  ValueNotifier<int> position = ValueNotifier(0);

  ///当前播放的视频总进度
  ValueNotifier<int> duration = ValueNotifier(0);

  String? title;
  String? subTitle;
  String? playUrl;
  String? coverUrl;
  dynamic fromMap(element);
}