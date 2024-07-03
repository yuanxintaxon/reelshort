import 'package:flutter/material.dart';
import 'package:preload_video/bean/load_state.dart';
import 'package:preload_video/bean/video_vo.dart';
import 'package:preload_video/models/video_item_model.dart';
import 'package:preload_video/models/video_model.dart';
import 'package:preload_video/pages/base_video_item.dart';
import 'package:preload_video/utils/string_util.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem<T extends VideoVo> extends BaseVideoItem<T> {
  final int index;
  final T item;
  final VideoModel videoModel;

  VideoItem(
      {super.key,
      required this.index,
      required this.item,
      required this.videoModel,
      super.buildPan,
      super.getPlayUrlService,
      super.needAdvBuild,
      super.needPurchaseBuild,
      super.needVipBuild,
      super.gettingPlayUrlBuild,
      super.getErrorPlayUrlBuild});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem>{
  ///当前播放的model
  late VideoItemModel itemModel;

  @override
  void initState() {
    itemModel = VideoItemModel(widget.index, widget.item,widget.videoModel);
    initCheckVideo();
    widget.videoModel.playItemCallBack.add(control);


    super.initState();
  }

  @override
  void dispose() {
    widget.videoModel.playItemCallBack.remove(control);
    itemModel.dispose();
    super.dispose();
  }

  void control(bool play){
    if(widget.index == currentPlayIndex){
      if(play){
        itemModel.playVideo();
      }else{
        itemModel.pauseVideo();
      }
    }
  }

  void initCheckVideo() async {
    if (StringUtil.isNULL(widget.item.playUrl)) {
      itemModel.serviceState.value = ServicePlayState.loading;

      final vo = await widget.getPlayUrlService?.call(widget.item);

      if (vo == null) {
        throw Exception("当前播放的item没有url，您需要实现<getPlayUrlService> 参数----");
      }

      itemModel.serviceState.value = vo.state;
      if (vo.state == ServicePlayState.free ||
          vo.state == ServicePlayState.see && !StringUtil.isNULL(vo.url)) {
        itemModel.videoVo.playUrl = vo.url;
        itemModel.initVideo(vo.url!);
      }
    } else {
      itemModel.initVideo(widget.item.playUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('item类型${widget.buildPan?.runtimeType}');
    return VisibilityDetector(
        key: Key('preload_video_${widget.item.hashCode}'),
        onVisibilityChanged: (VisibilityInfo info) {
          final visiblePercentage = info.visibleFraction * 100;
          //处于后台
          if (visiblePercentage == 0.0 && mounted) {
            itemModel.pauseVideo();
            itemModel.visible = false;
            print('不可见${widget.item.title}');
          }
          //处于前台
          if (visiblePercentage == 100 && mounted) {
            final hasError =
                itemModel.videoPlayController?.value.hasError ?? false;
            if (!hasError) {
              print('播放---');
              itemModel.playVideo();
            } else {
              print('不播放---');
            }
            itemModel.visible = true;
            print('可见${widget.item.title}');
          }
        },
        child: Stack(
          children: [
            Center(
              child: widget.getPlayUrlService == null
                  ? _buildVideoView()
                  : ValueListenableBuilder(
                      valueListenable: itemModel.serviceState,
                      builder: (BuildContext context, ServicePlayState value,
                          Widget? child) {
                        if (value == ServicePlayState.loading) {
                          return widget.gettingPlayUrlBuild ??
                              const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.green),
                                ),
                              );
                        }
                        if (value == ServicePlayState.error) {
                          return widget.getErrorPlayUrlBuild ??
                              Column(
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      initCheckVideo();
                                    },
                                    child: const Text('error,retry'),
                                  )
                                ],
                              );
                        }
                        if (value == ServicePlayState.see ||
                            value == ServicePlayState.free) {
                          return _buildVideoView();
                        }
                        if (value == ServicePlayState.needVip) {
                          return widget.needVipBuild ??
                              const Text('请实现needVipBuild参数');
                        }
                        if (value == ServicePlayState.needAdv) {
                          return widget.needAdvBuild ??
                              const Text('请实现needAdvBuild参数');
                        }
                        if (value == ServicePlayState.needPurchase) {
                          return widget.needPurchaseBuild ??
                              const Text('请实现needAdvBuild参数');
                        }
                        return const SizedBox();
                      },
                    ),
            ),
            widget.buildPan?.call(widget.index) ?? _buildDefaultPan(),
          ],
        ));
  }

  Widget _buildDefaultPan() {
    return Positioned(
        bottom: 20,
        left: 20,
        right: 0,
        child: Text(
          '${widget.item.title}',
          style: const TextStyle(color: Colors.red),
        ));
  }

  Widget _buildVideoView() {
    return ValueListenableBuilder(
      valueListenable: itemModel.playState,
      builder: (BuildContext context, PlayState value, Widget? child) {
        print('value = $value');
        if (value == PlayState.loading) {
          return const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          );
        }
        if (value == PlayState.error) {
          return Column(
            children: [
              MaterialButton(
                onPressed: () {
                  itemModel.initVideo(itemModel.videoVo.playUrl!);
                },
                child: Text('error,retry:${itemModel.playState.value}'),
              )
            ],
          );
        }
        if (value == PlayState.dispose) {
          return const Text('the video has dispose');
        }

        return itemModel.videoAsp.value < 0.6
            ? Center(
                child: SizedBox.expand(
                    child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(height: 16, width: 9, child: _buildVideo()),
              )))
            : Center(
                child: AspectRatio(
                  aspectRatio: itemModel.videoAsp.value,
                  child: _buildVideo(),
                ),
              );
      },
    );
  }

  Widget _buildVideo() {
    if (itemModel.videoPlayController == null) {
      return const SizedBox();
    }
    return GestureDetector(
        onTap: () {
          print('aa = ${itemModel.playState.value}');
          if (itemModel.playState.value == PlayState.playing) {
            itemModel.pauseVideo();
          } else if (itemModel.playState.value == PlayState.pause) {
            itemModel.playVideo();
          }
        },
        child: itemModel.videoAsp.value < 0.6
            ? Center(
                child: SizedBox.expand(
                    child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    height: 16,
                    width: 9,
                    child: VideoPlayer(itemModel.videoPlayController!)),
              )))
            : Center(
                child: AspectRatio(
                  aspectRatio: itemModel.videoAsp.value,
                  child: VideoPlayer(itemModel.videoPlayController!),
                ),
              ));
  }
}
