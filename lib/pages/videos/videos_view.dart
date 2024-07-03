import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'package:video_shop_flutter/video_shop_flutter.dart';
import 'videos_logic.dart';

class VideosPage extends StatelessWidget {
  final logic = Get.find<VideosLogic>();

  VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            VideoShopFlutter(
              // Called every time video page is changed.
              updateLastSeenPage: (lastSeenPageIndex) {
                // todo
              },
              onPlaying: () {
                logic.enableAutoPlay();
              },
              // Video data.
              listData: logic.data,
              autoPlay: logic.autoPlay.value,
              // Watched videos, it's updated every time new video is watched.
              videoWatched: logic.videoWatched,
              pageSize: 4,
              enableBackgroundContent: true,
              // Load more video data.
              loadMore: (page, pageSize) async {
                // Just for test.
                debugPrint("load more...");
                debugPrint("Video ${logic.videoWatched}");
                // List<Map<String, dynamic>> newData =
                //     await service.mapData((page + 2), 4);
                // if (newData.isNotEmpty) {
                //   setState(() {
                //     data = [...data, ...newData];
                //   });
                // }
                //.
              },
              // Your custom widget.
              // likeWidget: (video, updateData) {
              //   return LikeWidget(
              //     likes: video?.likes ?? 0,
              //     liked: video?.liked ?? false,
              //     updateData: updateData,
              //     id: video?.id,
              //   );
              // },
            ),
            "${logic.data.length}".toText
              ..style = Styles.ts_000000_20sp_regular,
          ],
        ),
      ),
    );
  }
}
