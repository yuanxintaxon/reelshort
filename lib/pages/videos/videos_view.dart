import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reelshort/routes/app_pages.dart';
import 'package:resource_common/resource_common.dart';
import 'package:short_video_scroller/short_video_scroller.dart';
import 'videos_logic.dart';

class VideosPage extends StatelessWidget {
  final logic = Get.find<VideosLogic>();
  final double aspectRatio = 3 / 4;
  VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c_2E2E2E,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Obx(
            () => logic.data.isNotEmpty
                ? ShortVideoScroller(
                    // Called every time video page is changed.
                    updateLastSeenPage: (lastSeenPageIndex) {
                      // logic.updateBrowserUrl(lastSeenPageIndex);
                    },
                    onPageChanged: (pageIndex) {
                      // logic.disableAutoPlay();
                      logic.updateBrowserUrl(pageIndex);
                    },
                    onPlaying: () {
                      logic.enableAutoPlay();
                    },
                    onBack: () {
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
                    shareWidget: _shareWidget,
                  )
                : Container(),
          ),
          Obx(
            () => logic.showShareModal.value && logic.videoToShare.value != null
                ? _buildShareModal()
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildShareModal() => FadeIn(
        duration: const Duration(milliseconds: 500),
        animate: logic.showShareModal.value ? true : false,
        child: Stack(
          children: [
            Container(
              color: Styles.c_000000_opacity80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Styles.c_FFFFFF,
                        ),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            11.vSpace,
                            StrRes.share.toText
                              ..style =
                                  Styles.ts_000000_20sp_extrabold_sofia_pro,
                            2.vSpace,
                            Divider(
                              color: Styles.c_C2C2C2,
                              thickness: 0.2,
                            ),
                            12.vSpace,
                            _buildThumbnailView(
                                logic.videoToShare.value?.thumbnail),
                            8.vSpace,
                            "${logic.videoToShare.value?.videoTitle}".toText
                              ..style = Styles.ts_000000_19sp_bold_sofia_pro
                              ..textAlign = TextAlign.center,
                            8.vSpace,
                            "${logic.videoToShare.value?.videoDescription}"
                                .toText
                              ..style = Styles.ts_000000_13sp_regular_sofia_pro
                              ..maxLines = 3
                              ..overflow = TextOverflow.ellipsis
                              ..textAlign = TextAlign.center,
                            20.vSpace,
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Styles.c_F5F5F5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: logic.facebookShare,
                              child: Column(
                                children: [
                                  ImageRes.facebookCircular.toImage
                                    ..width = 32
                                    ..height = 32,
                                  5.vSpace,
                                  StrRes.facebook.toLowerCase().toText
                                    ..style =
                                        Styles.ts_000000_11sp_regular_sofia_pro
                                    ..textAlign = TextAlign.center,
                                ],
                              ),
                            ),
                            35.hSpace,
                            GestureDetector(
                              onTap: logic.twitterShare,
                              child: Column(
                                children: [
                                  ImageRes.twitterCircular.toImage
                                    ..width = 32
                                    ..height = 32,
                                  5.vSpace,
                                  StrRes.twitter.toLowerCase().toText
                                    ..style =
                                        Styles.ts_000000_11sp_regular_sofia_pro
                                    ..textAlign = TextAlign.center,
                                ],
                              ),
                            ),
                            35.hSpace,
                            GestureDetector(
                              onTap: logic.copyLink,
                              child: Column(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Styles.c_E5E5E5,
                                    ),
                                    child: ImageRes.linkGrey.toImage
                                      ..color = Styles.c_666666,
                                  ),
                                  5.vSpace,
                                  StrRes.link.toText
                                    ..style =
                                        Styles.ts_000000_11sp_regular_sofia_pro
                                    ..textAlign = TextAlign.center,
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                30.vSpace,
                ImageRes.closeWhite.toImage
                  ..width = 16
                  ..height = 16
                  ..onTap = logic.closeShare,
              ],
            ),
          ],
        ),
      );

  Widget _buildThumbnailView(String? url) => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 90,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: (url != null && IMUtils.isUrlValid(url))
                ? (ImageUtil.networkImage(
                    url: url,
                    fit: BoxFit.cover,
                  ))
                : (ImageRes.thumbnailPlaceholder.toImage..fit = BoxFit.cover),
          ),
        ),
      );

  Widget _shareWidget(VideoModel? video) {
    return _getSocialAction(
      icon: Icons.reply,
      textDirection: TextDirection.rtl,
      title: 'Share',
      onTap: () => logic.share(video),
    );
  }

  Widget _getSocialAction({
    required String title,
    required IconData icon,
    TextDirection textDirection = TextDirection.ltr,
    Function()? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
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
          ])),
    );
  }
}
