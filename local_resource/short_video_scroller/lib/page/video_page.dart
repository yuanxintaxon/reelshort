import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';
import 'package:short_video_scroller/short_video_scroller.dart';

class VideoPage extends StatelessWidget {
  /// Create video page view.
  const VideoPage({
    Key? key,
    required this.video,
    this.customVideoInfo,
    required this.followWidget,
    required this.likeWidget,
    required this.commentWidget,
    required this.shareWidget,
    required this.buyWidget,
    required this.viewWidget,
    this.informationPadding,
    required this.videoWatched,
    this.informationAlign,
    this.actionsAlign,
    this.actionsPadding,
    required this.index,
    required this.updateLastSeenPage,
    required this.onPlaying,
    required this.onBack,
    this.autoPlay = false,
  }) : super(key: key);
  final VideoModel video;
  final Widget Function(VideoModel? video)? customVideoInfo;
  final Widget Function(VideoModel? video)? followWidget;
  final Widget Function(VideoModel? video, Function(int likes, bool liked))?
      likeWidget;
  final Widget Function(VideoModel? video)? commentWidget;
  final Widget Function(VideoModel? video)? shareWidget;
  final Widget Function(VideoModel? video)? buyWidget;
  final Widget Function(VideoModel? video, int index)? viewWidget;
  final EdgeInsetsGeometry? informationPadding;
  final List<String> videoWatched;
  final AlignmentGeometry? informationAlign;
  final AlignmentGeometry? actionsAlign;
  final EdgeInsetsGeometry? actionsPadding;
  final int index;
  final Function(int lastSeenPage)? updateLastSeenPage;
  final Function()? onPlaying;
  final Function()? onBack;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: VideoItem(
        video: video,
        videoWatched: videoWatched,
        index: index,
        updateLastSeenPage: updateLastSeenPage,
        onPlaying: onPlaying,
        autoPlay: autoPlay,
        appBar: _buildAppBar(),
        actionToolBar: _buildActionToolBar(),
      ),
    );
  }

  Widget _buildAppBar() => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onBack,
        child: Container(
          height: 44,
          padding: const EdgeInsets.only(left: 10),
          child: IntrinsicWidth(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageRes.leftChevronWhite.toImage
                  ..width = 22
                  ..height = 22,
                1.hSpace,
                Flexible(
                  child: "${video.videoTitle}".toText
                    ..style = Styles.ts_FFFFFF_15sp_regular_sofia_pro,
                ),
                13.hSpace,
                "${video.currentEp}/${video.totalEp}".toText
                  ..style = Styles.ts_FFFFFF_15sp_regular_sofia_pro,
                18.hSpace,
              ],
            ),
          ),
        ),
      );

  Widget _buildActionToolBar() => ActionsToolbar(
        video: video,
        followWidget: followWidget,
        likeWidget: likeWidget,
        commentWidget: commentWidget,
        shareWidget: shareWidget,
        buyWidget: buyWidget,
        viewWidget: viewWidget,
        index: index,
      );
}
