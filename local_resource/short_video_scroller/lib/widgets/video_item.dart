import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:short_video_scroller/model/video_model.dart';
import 'package:short_video_scroller/widgets/video_player_app.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem extends StatefulWidget {
  /// Create video item.
  const VideoItem({
    Key? key,
    required this.video,
    required this.videoWatched,
    required this.updateLastSeenPage,
    required this.onPlaying,
    required this.unmuteSub,
    required this.autoPlay,
    required this.index,
    required this.appBar,
    required this.actionToolBar,
  }) : super(key: key);
  final VideoModel video;
  final List<String> videoWatched;
  final Function(int lastSeenPage)? updateLastSeenPage;
  final Function()? onPlaying;
  final Stream<int> unmuteSub;
  final bool autoPlay;
  final int index;
  final Widget appBar;
  final Widget actionToolBar;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    print("creturn initvideo ${widget.video.id}");
    super.initState();
  }

  @override
  void dispose() async {
    print("creturn disposing ${widget.video.id}");
    super.dispose();
    if (_videoController != null) {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
      }
    }
    await _videoController?.dispose().then((value) {
      _videoController = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return _videoController != null && _videoController!.value.isInitialized
        ? VisibilityDetector(
            onVisibilityChanged: (visibleInfo) {
              if (visibleInfo.visibleFraction > 0.8) {
                if (!_videoController!.value.isPlaying) {
                  if (widget.autoPlay) {
                    _videoController!.play();
                    widget.onPlaying?.call();
                  }

                  _videoController!.setLooping(false);
                  // Update watched videos.
                  if (widget.video.id != null) {
                    widget.videoWatched.add(widget.video.id!.toString());
                  }
                  // Update last seen video.
                  widget.updateLastSeenPage?.call(widget.index);
                }
              }
              if (visibleInfo.visibleFraction == 0) {
                if (_videoController != null) {
                  if (_videoController!.value.isPlaying) {
                    _videoController!.pause();
                  }
                }
              }
            },
            key: UniqueKey(),
            child: VideoPlayerApp(
              video: widget.video,
              controller: _videoController!,
              autoPlay: widget.autoPlay,
              onPlaying: widget.onPlaying,
              unmuteSub: widget.unmuteSub,
              appBar: widget.appBar,
              actionToolBar: widget.actionToolBar,
            ),
          )
        : VisibilityDetector(
            key: UniqueKey(),
            child: Container(
              color: Colors.black,
              width: width,
              height: height,
              child: Image.network(
                widget.video.thumbnail ?? "",
                // loadingBuilder: (context, child, loadingProgress) {
                //   return const AspectRatio(
                //     aspectRatio: 16 / 9,
                //     child: Center(
                //       child: Icon(Icons.play_arrow, size: 80, color: Colors.grey),
                //     ),
                //   );
                // },
                errorBuilder: (context, error, stackTrace) {
                  return const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(
                      child:
                          Icon(Icons.play_arrow, size: 80, color: Colors.grey),
                    ),
                  );
                },
                fit: BoxFit.fitWidth,
              ),
            ),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.6) {
                _videoController = VideoPlayerController.networkUrl(
                    Uri.parse(widget.video.url))
                  ..initialize().then(
                    (_) {
                      // mute on init
                      _videoController!.setVolume(0.0);
                      setState(() {});
                    },
                  );
              }
            },
          );
  }
}
