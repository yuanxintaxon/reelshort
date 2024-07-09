import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';

class VideoPlayerApp extends StatefulWidget {
  /// Create video player.
  const VideoPlayerApp({
    Key? key,
    required this.video,
    required this.controller,
    required this.autoPlay,
    required this.onPlaying,
    required this.unmuteSub,
    required this.appBar,
    required this.actionToolBar,
  }) : super(key: key);
  final VideoModel video;
  final VideoPlayerController controller;
  final bool autoPlay;
  final Function()? onPlaying;
  final Stream<int> unmuteSub;
  final Widget appBar;
  final Widget actionToolBar;

  @override
  State<VideoPlayerApp> createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  late VideoPlayerController _controller;
  bool _showPause = true;
  Duration minDuration = Duration.zero,
      maxDuration = Duration.zero,
      currDuration = Duration.zero;

  bool showOnlyVideo = false;
  Timer? _hideTimer;
  final int secToHideFloatingWidgets = 1;
  final cinemaMode = true;
  StreamSubscription? _unmuteSub;

  @override
  void initState() {
    _controller = widget.controller;

    // init durations
    currDuration = _controller.value.position;
    maxDuration = _controller.value.duration;

    // listener for live UI update
    _controller.addListener(handleLiveUIUpdate);
    _unmuteSub = widget.unmuteSub.listen(handleUnmute);
    super.initState();
  }

  @override
  void dispose() {
    _unmuteSub?.cancel;
    super.dispose();
  }

  void handleUnmute(int value) {
    Logger.print("creturn unmute from video player app");
    _controller.setVolume(1.0);
  }

  void handleLiveUIUpdate() {
    // update UI state of playing/pause
    if (_controller.value.isPlaying) {
      hideFloatingWidgets();
      if (_showPause) {
        _showPause = false;
      }
    } else {
      if (!_showPause) {
        _showPause = true;
        toggleShowOnlyVideo(show: false);
      }
    }
    // update UI for current duration position
    currDuration = _controller.value.position;

    if (!mounted) return;
    setState(() {});
  }

  void hideFloatingWidgets() {
    if (showOnlyVideo || !_controller.value.isPlaying) return;
    if (_hideTimer != null) return;
    _hideTimer =
        Timer.periodic(const Duration(milliseconds: 3000), (Timer timer) {
      if (timer.tick >= secToHideFloatingWidgets) {
        stopHideTimer();
        toggleShowOnlyVideo(show: true);
        return;
      }
    });
  }

  void stopHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = null;
  }

  void toggleShowOnlyVideo({bool? show}) {
    if (show != null) {
      if (show == true) {
        if (showOnlyVideo || !_controller.value.isPlaying) return;
        showOnlyVideo = true;
      } else {
        showOnlyVideo = false;
      }
    } else {
      showOnlyVideo = !showOnlyVideo;
    }

    if (!mounted) return;
    setState(() {});
  }

  void togglePlayVideo() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      setState(() {
        _showPause = true;
      });
    } else {
      _controller.play();
      widget.onPlaying?.call();
      setState(() {
        _showPause = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenRatio = MediaQuery.of(context).size.aspectRatio;
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: _buildVideoView(screenRatio, context)),
        Align(
          alignment: Alignment.topCenter,
          child: FadeOut(
            animate: showOnlyVideo ? true : false,
            child: IgnorePointer(
                ignoring: showOnlyVideo, child: _buildGradientBg()),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 0,
          child: FadeOut(
            animate: showOnlyVideo ? true : false,
            child: IgnorePointer(
                ignoring: showOnlyVideo, child: widget.actionToolBar),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: FadeOut(
            animate: showOnlyVideo ? true : false,
            child: IgnorePointer(ignoring: showOnlyVideo, child: widget.appBar),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FadeOut(
            animate: showOnlyVideo ? true : false,
            child: IgnorePointer(
                ignoring: showOnlyVideo, child: _buildVideoControlPanel()),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoView(double screenRatio, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _controller.value.isPlaying ? toggleShowOnlyVideo : null,
          onDoubleTap: togglePlayVideo,
          child: AbsorbPointer(
            child: Container(
              color: Colors.black,
              width: width,
              height: height,
              child:
                  // test
                  //     FittedBox(
                  //   fit: BoxFit.cover,
                  //   child: SizedBox(
                  //     width: _controller.value.size.width,
                  //     height: _controller.value.size.height,
                  //     child: _buildVideoPlayer(),
                  //   ),
                  // ),
                  Stack(
                alignment: Alignment.center,
                children: [
                  // AspectRatio(
                  //   aspectRatio: _controller.value.aspectRatio,
                  //   child: _buildVideoPlayer(),
                  // ),
                  SizedBox(
                    height: height,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: _buildVideoPlayer()),
                    ),
                  ),
                  Opacity(
                    opacity:
                        _controller.value.position == Duration.zero ? 1 : 0,
                    child: SizedBox(
                        width: width, height: height, child: _buildThumbnail()),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_showPause) _buildPauseIcon(),
      ],
    );
  }

  Widget _buildThumbnail() {
    return Image.network(
      widget.video.thumbnail ?? "",
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildVideoPlayer() => ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(cinemaMode ? 0.15 : 0), BlendMode.srcOver),
      child: VideoPlayer(_controller));

  Widget _buildPauseIcon() => Align(
        alignment: Alignment.center,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: togglePlayVideo,
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.play_arrow_rounded,
                color: Colors.white.withOpacity(1.0), size: 30),
          ),
        ),
      );

  Widget _buildGradientBg() => Container(
        height: 44,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Styles.c_000000_opacity0,
              Styles.c_000000_opacity75,
            ],
            stops: const [0.0, 1.0],
          ),
        ),
      );

  Widget _buildVideoControlPanel() => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 49,
            width: double.infinity,
            color: Colors.transparent,
          ),
          Container(
            color: Styles.c_000000,
            height: 44,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 8, right: 18, top: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _controller.value.isPlaying
                      ? _controller.pause
                      : _controller.play,
                  child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: _controller.value.isPlaying
                          ? Styles.c_9B9B9B
                          : Styles.c_FFFFFF,
                      size: 24),
                ),
                8.hSpace,
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Styles.c_807F80,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: IMUtils.seconds2HMS(currDuration.inSeconds),
                          style: TextStyle(
                            color: Styles.c_FFFFFF,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: " / "),
                        TextSpan(
                            text: IMUtils.seconds2HMS(maxDuration.inSeconds)),
                      ],
                    ),
                  ),
                ),
                "720P".toText
                  ..style = TextStyle(
                    color: Styles.c_FFFFFF,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 1,
            left: 0,
            right: 0,
            child: _buildProgressSlider(),
          ),
        ],
      );

  Widget _buildProgressSlider() => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 3.0),
          overlayShape: SliderComponentShape.noOverlay,
          trackShape: CustomSliderTrackShape(
              activeTrackHeight: 1.5, inactiveTrackHeight: 1.5),
        ),
        child: Slider(
          activeColor: Styles.c_EA3E54,
          inactiveColor: Styles.c_FFFFFF,
          thumbColor: Styles.c_EA3E54,
          value: _controller.value.position.inSeconds.toDouble(),
          min: minDuration.inSeconds.toDouble(),
          max: maxDuration.inSeconds.toDouble(),
          onChanged: (value) async {
            final durationPos = Duration(seconds: value.toInt());
            _controller.seekTo(durationPos);
            if (!mounted) return;
            setState(() {});
          },
          onChangeStart: (value) async {
            // if (status == VeryAudioPlayerStatus.playing) {
            //   await pauseAudio(updateStatus: false);
            // }
          },
          onChangeEnd: (value) async {
            // if (status == VeryAudioPlayerStatus.playing) {
            //   await playAudio(updateStatus: false);
            // }
          },
        ),
      );
}

class CustomSliderTrackShape extends SliderTrackShape {
  final double activeTrackHeight;
  final double inactiveTrackHeight;

  CustomSliderTrackShape(
      {this.activeTrackHeight = 1.5, this.inactiveTrackHeight = 1.5});

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final Paint activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.black;
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey;

    final double activeTrackRadius = activeTrackHeight / 2;
    final double inactiveTrackRadius = inactiveTrackHeight / 2;

    final RRect activeRRect = RRect.fromLTRBR(
      offset.dx,
      thumbCenter.dy - activeTrackRadius,
      thumbCenter.dx,
      thumbCenter.dy + activeTrackRadius,
      Radius.circular(activeTrackRadius),
    );

    final RRect inactiveRRect = RRect.fromLTRBR(
      thumbCenter.dx,
      thumbCenter.dy - inactiveTrackRadius,
      parentBox.size.width - offset.dx,
      thumbCenter.dy + inactiveTrackRadius,
      Radius.circular(inactiveTrackRadius),
    );

    context.canvas.drawRRect(activeRRect, activePaint);
    context.canvas.drawRRect(inactiveRRect, inactivePaint);

    if (secondaryOffset != null) {
      final Paint secondaryPaint = Paint()
        ..color = sliderTheme.secondaryActiveTrackColor ?? Colors.black87;
      final RRect secondaryRRect = RRect.fromLTRBR(
        thumbCenter.dx,
        thumbCenter.dy - activeTrackRadius,
        secondaryOffset.dx,
        thumbCenter.dy + activeTrackRadius,
        Radius.circular(activeTrackRadius),
      );
      context.canvas.drawRRect(secondaryRRect, secondaryPaint);
    }
  }

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = activeTrackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 2 * offset.dx;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
