

import 'package:flutter/cupertino.dart';
import 'package:preload_video/bean/load_state.dart';
import 'package:preload_video/bean/video_vo.dart';
import 'package:preload_video/models/video_model.dart';
import 'package:video_player/video_player.dart';

///管理当前播放的item数据
class VideoItemModel<T extends VideoVo> extends ChangeNotifier{

  ///当前播放的下标
  late int index;

  ///当前播放的模型
  late T videoVo;

  late VideoModel model;

  ///视频播放器
  VideoPlayerController? _videoPlayerController;

  VideoPlayerController? get videoPlayController => _videoPlayerController;

  ///当前播放的item是否可见
  bool visible = true;

  ///app处于后台之前，播放器是否正在播放
  ///这用于在回到前台时，播放器根据前台之前的状态进行操作
  ///如：切换到后台之前，播放器是播放的状态，当app回到前台，播放器也应该继续播放
  bool beforeBackstageIsPlaying = false;


  ///播放器加载状态
  ValueNotifier<PlayState> playState = ValueNotifier(PlayState.loading);

  ///视频链接获取状态
  ValueNotifier<ServicePlayState> serviceState = ValueNotifier(ServicePlayState.loading);

  ///视频宽高比
  ValueNotifier<double> videoAsp = ValueNotifier(0.5);

  VideoItemModel(this.index,this.videoVo,this.model);

  ///加载视频
  ///[url] 视频链接
  void initVideo(String url)async{
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url),formatHint: VideoFormat.hls);
    await _videoPlayerController?.initialize();
    final value = _videoPlayerController?.value;
    if(!(value?.isInitialized??false)){
      playState.value = PlayState.error;
      return;
    }
    if(value?.hasError??false){
      playState.value = PlayState.error;
      return;
    }
    videoVo.duration.value = value?.duration.inMilliseconds??0;
    videoAsp.value = value?.aspectRatio??0.5;
    playState.value = PlayState.idle;
    _videoPlayerController?.addListener(_videoListener);
    _videoPlayerController?.setLooping(true);
    if(index == currentPlayIndex){
      _videoPlayerController?.play();
    }
  }

  ///视频监听器
  void _videoListener(){
    final value = _videoPlayerController?.value;
    if(value == null){
      playState.value = PlayState.error;
      return;
    }
    if(value.hasError){
      playState.value = PlayState.error;
      return;
    }

    videoVo.position.value = value.position.inMilliseconds;
    videoVo.duration.value = value.duration.inMilliseconds;
    if(value.isPlaying){
      if(value.isBuffering){
        playState.value = PlayState.buffering;
      }else{
        beforeBackstageIsPlaying = true;
        model.changeCurrentIsPlaying(true);
        playState.value = PlayState.playing;
        debugPrint('正在播放:${videoVo.title}');
      }
    }else{
      beforeBackstageIsPlaying = false;
      model.changeCurrentIsPlaying(false);
      playState.value = PlayState.pause;
    }

  }


  ///暂停播放
  void pauseVideo(){
    _videoPlayerController?.pause();
  }

  ///播放
  void playVideo()async{
    await _videoPlayerController?.play();
  }

  ///销毁播放器
  void disposeVideo(){
    _videoPlayerController?.removeListener(_videoListener);
    _videoPlayerController?.dispose();
  }

  @override
  void dispose() {
    disposeVideo();
    super.dispose();
  }
}