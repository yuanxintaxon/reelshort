library preload_video;
import 'package:flutter/material.dart';
import 'package:preload_video/bean/load_state.dart';
import 'package:preload_video/bean/video_vo.dart';
import 'package:preload_video/models/video_model.dart';
import 'package:preload_video/pages/base_video_item.dart';
import 'package:preload_video/pages/video_item.dart';
import 'package:preload_video/widget/custom_preload_page_view.dart';

///封装一个支持预加载、业务控制的播放器
///1）：预加载
///2）：播放时避免屏幕熄灭
///3）：横竖屏切换
///4）：自定义样式
///5）：业务化
///
///参数说明:
/// 参数 [model] 是初始视频列表的基础业务类，开发者需要创建一个类去继承
///
/// 参数 [initPlayIndex] 是用于初始播放的下标，即从 第 X 个视频播起
///
/// 参数 [buildPan] 是构建视频以外的布局，如：评论、点赞等等
///
/// 参数 [getPlayUrlService] 是用于获取播放地址的业务。
///     当播放列表中的某一个item没有播放地址，此参数必传，用于获取播放地址的逻辑。
///     无论item有没有播放地址，若传了该参数，则优先使用该参数去获取播放地址。
///
/// 参数 [loadingBuild] 是构建获取视频列表过程中的构建布局
///
/// 参数 [errorBuild] 是构建获取视频列表过程中失败的构建布局
///
/// 参数 [noDataBuild] 是构建获取视频列表后没有数据的构建布局
///
/// 参数 [noMoreBuild] 是构建获取视频列表没有更多数据时的构建布局
///
/// 参数 [scrollSpeed] 更改pageView的滚动速度，取值0～1，越大则越快，默认0.4。注意：只在首次起作用，
///                   修改值后无法实时生效，销毁页面再重新进入即可。
///
/// 参数 [needVipBuild] 加载某个视频，提示需要vip才能播放的布局
///
/// 参数 [needPurchaseBuild] 加载某个视频，提示需要购买才能播放的布局
///
/// 参数 [needAdvBuild] 加载某个视频，提示需要看广告才能播放的布局
///
class PreloadVideo<T extends VideoVo, M extends VideoModel<T>> extends StatefulWidget {
  final M model;
  final int initPlayIndex;
  final Widget? loadingBuild;
  final Widget? errorBuild;
  final Widget? noDataBuild;
  final Widget? noMoreBuild;

  ///滚动控制相关
  final double scrollSpeed;//滚动速度 0-1,（无法热加载，单次设置）

  ///以下参数将赋值给列表中的item管理
  final ItemPanBuilder? buildPan;
  final Future<ServicePlayStateVo> Function(T item)? getPlayUrlService;
  final Widget? needVipBuild;
  final Widget? needPurchaseBuild;
  final Widget? needAdvBuild;

  final Widget? gettingPlayUrlBuild;
  final Widget? getErrorPlayUrlBuild;

  const  PreloadVideo(
      {super.key,
        required this.model,
        this.initPlayIndex = 0,
        this.buildPan,
        this.getPlayUrlService,
        this.loadingBuild,
        this.errorBuild,
        this.noDataBuild,
        this.noMoreBuild,
        this.scrollSpeed = 0.4,
        this.needAdvBuild,
        this.needPurchaseBuild,
        this.needVipBuild,
        this.gettingPlayUrlBuild,
        this.getErrorPlayUrlBuild,
      });

  @override
  State<PreloadVideo> createState() => _PreloadVideoState<T>();
}

class _PreloadVideoState<T extends VideoVo> extends State<PreloadVideo> {
  final preloadController = PreloadPageController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      widget.model.loadState.value = await widget.model.loadData();
      if (widget.model.loadState.value == DataLoadState.success) {


        await Future.delayed(const Duration(milliseconds: 300));
        if(mounted){
          currentPlayIndex = widget.initPlayIndex;
          preloadController.jumpToPage(widget.initPlayIndex);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: widget.model.loadState,

          builder: (BuildContext context, value, Widget? child) {
            if (value == DataLoadState.loading) {
              return widget.loadingBuild ??
                  const Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  );
            }
            if (value == DataLoadState.noData) {
              return widget.loadingBuild ??
                  const Center(
                    child: Text('no data'),
                  );
            }
            if (value == DataLoadState.error) {
              return widget.loadingBuild ??
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('load error'),
                        MaterialButton(onPressed: (){
                          widget.model.loadState.value = DataLoadState.loading;
                          init();
                        },child: const Text('retry'),)
                      ],
                    ),
                  );
            }
            return _buildSuccess();
          },
        ));
  }

  Widget _buildSuccess() {
    return PreloadPageView.builder(
       scrollSpeed: widget.scrollSpeed,
        itemCount: widget.model.dataList.value.length,
        scrollDirection: Axis.vertical,
        preloadPagesCount: 2,
        controller: preloadController,
        onPageChanged: (index){
          currentPlayIndex = index;
        },
        itemBuilder: (context, index) {
          final item = widget.model.dataList.value[index];
          return VideoItem<T>(
            videoModel: widget.model,
            index: index,
            item: item as T,
            buildPan: widget.buildPan,
          );
        });
  }
}
