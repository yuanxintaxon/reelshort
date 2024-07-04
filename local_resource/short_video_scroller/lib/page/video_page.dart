import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';
import 'package:short_video_scroller/page/page.dart';
import 'package:short_video_scroller/short_video_scroller.dart';

final List<Color> gradientBackground = [
  const Color(0xff000000).withOpacity(0.9),
  const Color(0xff000000).withOpacity(0.8),
  const Color(0xff000000).withOpacity(0.7),
  const Color(0xff000000).withOpacity(0.6),
  const Color(0xff000000).withOpacity(0.5),
  const Color(0xff000000).withOpacity(0.4),
  const Color(0xff000000).withOpacity(0.3),
  const Color(0xff000000).withOpacity(0.2),
  const Color(0xff000000).withOpacity(0.1),
  const Color(0xff000000).withOpacity(0.0),
];
const List<double> stopGradient = [
  0.1,
  0.2,
  0.3,
  0.4,
  0.5,
  0.6,
  0.7,
  0.8,
  0.9,
  1.0,
];

class VideoPage extends StatefulWidget {
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
    this.enableBackgroundContent = false,
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
  final bool? enableBackgroundContent;
  final bool autoPlay;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with AutomaticKeepAliveClientMixin<VideoPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          // Video.
          Align(
            alignment: Alignment.center,
            child: VideoItem(
              video: widget.video,
              videoWatched: widget.videoWatched,
              index: widget.index,
              updateLastSeenPage: widget.updateLastSeenPage,
              onPlaying: widget.onPlaying,
              autoPlay: widget.autoPlay,
            ),
          ),
          // Background content.
          if (widget.enableBackgroundContent != null &&
              widget.enableBackgroundContent!)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: stopGradient,
                    colors: gradientBackground,
                  ),
                ),
              ),
            ),
          // Video info______________.
          Align(
            alignment: widget.informationAlign ?? Alignment.bottomLeft,
            child: Padding(
              padding: widget.informationPadding ??
                  const EdgeInsets.only(left: 20, bottom: 70),
              child: (widget.customVideoInfo != null)
                  ? widget.customVideoInfo!(widget.video)
                  : VideoInformation(
                      widget.video.user ?? "",
                      widget.video.videoTitle ?? "",
                      widget.video.videoDescription ?? "",
                    ),
            ),
          ),
          // Video actions______________.
          Align(
            alignment: widget.actionsAlign ?? Alignment.bottomRight,
            child: Padding(
              padding:
                  widget.actionsPadding ?? const EdgeInsets.only(bottom: 70),
              child: ActionsToolbar(
                enableBackgroundContent: widget.enableBackgroundContent,
                video: widget.video,
                followWidget: widget.followWidget,
                likeWidget: widget.likeWidget,
                commentWidget: widget.commentWidget,
                shareWidget: widget.shareWidget,
                buyWidget: widget.buyWidget,
                viewWidget: widget.viewWidget,
                index: widget.index,
              ),
            ),
          ),
          // App bar
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onBack,
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
                        child: "${widget.video.videoTitle}".toText
                          ..style = Styles.ts_FFFFFF_15sp_regular_sofia_pro,
                      ),
                      13.hSpace,
                      "${widget.video.currentEp}/${widget.video.totalEp}".toText
                        ..style = Styles.ts_FFFFFF_15sp_regular_sofia_pro,
                      18.hSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
