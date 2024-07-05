import 'package:flutter/material.dart';
import 'package:short_video_scroller/model/model.dart';

class ActionsToolbar extends StatelessWidget {
  final VideoModel video;
  final Widget Function(VideoModel? video)? followWidget;
  final Widget Function(VideoModel? video, Function(int likes, bool liked))?
      likeWidget;
  final Widget Function(VideoModel? video)? commentWidget;
  final Widget Function(VideoModel? video)? shareWidget;
  final Widget Function(VideoModel? video)? buyWidget;
  final Widget Function(VideoModel? video, int index)? viewWidget;
  final int index;

  /// Create video actions bar.
  const ActionsToolbar({
    super.key,
    required this.video,
    required this.followWidget,
    required this.likeWidget,
    required this.commentWidget,
    required this.shareWidget,
    required this.buyWidget,
    required this.viewWidget,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (followWidget != null)
              ? followWidget!(video)
              : const SizedBox.shrink(),
          (likeWidget != null)
              ? likeWidget!(
                  video,
                  (likes, liked) {
                    video.likes = likes;
                    video.liked = liked;
                  },
                )
              : _getSocialAction(icon: Icons.favorite_rounded, title: "39.1k"),
          (shareWidget != null)
              ? shareWidget!(video)
              : _getSocialAction(icon: Icons.star_rounded, title: '1.5m'),
          (shareWidget != null)
              ? shareWidget!(video)
              : _getSocialAction(icon: Icons.layers_rounded, title: 'List'),
          (shareWidget != null)
              ? shareWidget!(video)
              : _getSocialAction(
                  icon: Icons.reply,
                  textDirection: TextDirection.rtl,
                  title: 'Share'),
        ],
      ),
    );
  }

  /// Create default actions
  ///
  /// The title & icon are required.
  Widget _getSocialAction(
      {required String title,
      required IconData icon,
      TextDirection textDirection = TextDirection.ltr}) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon,
              size: 30.0, textDirection: textDirection, color: Colors.white),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0)),
          )
        ]));
  }
}
