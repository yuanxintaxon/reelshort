import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'package:short_video_scroller/short_video_scroller.dart';
import 'videos_logic.dart';

class VideosPage extends StatelessWidget {
  final logic = Get.find<VideosLogic>();

  VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          alignment: Alignment.topLeft,
          children: [
            if (logic.data.isNotEmpty)
              ShortVideoScroller(
                // Called every time video page is changed.
                updateLastSeenPage: (lastSeenPageIndex) {
                  // logic.updateBrowserUrl(lastSeenPageIndex);
                },
                onPageChanged: (pageIndex) {
                  logic.updateBrowserUrl(pageIndex);
                },
                onPlaying: () {
                  logic.enableAutoPlay();
                },
                onBack: () {
                  Logger.print("creturn back");
                  logic.returnHome();
                },
                // Video data.
                listData: logic.data,
                autoPlay: logic.autoPlay.value,
                // Watched videos, it's updated every time new video is watched.
                videoWatched: logic.videoWatched,
                pageSize: 4,
                enableBackgroundContent: false,
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
          ],
        ),
      ),
    );
  }
}
