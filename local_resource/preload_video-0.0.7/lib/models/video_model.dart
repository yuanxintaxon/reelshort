
import 'package:flutter/cupertino.dart';
import 'package:preload_video/bean/load_state.dart';
import 'package:preload_video/bean/video_vo.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

typedef ControllerPayItemCallBack = void Function(bool play);

///当前播放的位置
int currentPlayIndex = 0;

///播放器内容提供者
///该类主要是管理与业务相关数据。
///泛型[T] 为VideoVo的子类，开发者需继承
abstract class VideoModel<T extends VideoVo> extends ChangeNotifier{

  ///当前播放的视频是否正在播放
  bool _currentIsPlaying = false;
  get currentIsPlaying => _currentIsPlaying;

  ///视频列表
  ValueNotifier<List<T>> dataList = ValueNotifier([]);

  ///获取视频状态
  ValueNotifier<DataLoadState> loadState = ValueNotifier(DataLoadState.loading);


  List<ControllerPayItemCallBack> playItemCallBack=[];


  ///当前播放器播放状态改变时，设置锁屏状态
  void changeCurrentIsPlaying(bool value){
    _currentIsPlaying = value;
    if(value){
      WakelockPlus.enable();
    }else{
      WakelockPlus.disable();
    }
  }

  ///获取视频列表（业务）
  Future<DataLoadState> loadData({bool loadMore = false});


  void play(){
    for (var element in playItemCallBack) {
      element.call(true);
    }
  }

  void pause(){
    for (var element in playItemCallBack) {
      element.call(false);
    }
  }


}