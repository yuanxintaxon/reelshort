import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:resource_common/resource_common.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final double aspectRatio = 3 / 4;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Styles.c_000000,
        appBar: TitleBar.navbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildCarouselView(),
              20.vSpace,
              _buildMostTrendingView(),
              60.vSpace,
              _buildContinueWatchingView(),
              30.vSpace,
              _buildTopPickView(),
              30.vSpace,
              _buildNewReleaseView(),
              30.vSpace,
              _buildHiddenIdentityView(),
              30.vSpace,
              _buildLoveAtFirstSightView(),
              30.vSpace,
              _buildYoungLoveView(),
              30.vSpace,
              _buildToxicNTabooView(),
              30.vSpace,
              _buildWerewolfNVampireView(),
              30.vSpace,
              _buildAsianStoriesView(),
              30.vSpace,
              _buildMoreRecommendedView(),
              40.vSpace,
              if (true) ...[
                StrRes.slidToBottomHint.toText
                  ..style = Styles.ts_8070F80_12sp_bold_sofia_pro,
                80.vSpace,
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavbarView() => Container(
        height: 200,
        decoration: BoxDecoration(color: Styles.c_2E2E2E),
      );

  Widget _buildCarouselView() => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              onPageChanged: (index, reason) => logic.updateIndex(index),
              viewportFraction: 1.0,
              aspectRatio: 16 / 9,
              height: 160,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              disableCenter: true,
              // enlargeCenterPage: true,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            itemCount: 5,
            itemBuilder: (context, index, realIndex) => _buildImageBannerTile(
                "https://picsum.photos/id/${index + 50}/1920/1080"),
          ),
          Container(
            height: 36,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Styles.c_000000_opacity0,
                  Styles.c_000000_opacity88,
                  Styles.c_000000_opacity100,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.9, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AnimatedSmoothIndicator(
              activeIndex: logic.activeIndex.value,
              count: 5,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                spacing: 10.0,
                radius: 10.0,
                dotWidth: 14.0,
                dotHeight: 4.0,
                expansionFactor: 1.5,
                dotColor: Styles.c_898783,
                activeDotColor: Styles.c_FFFFFF,
              ),
            ),
          ),
        ],
      );

  Widget _buildImageBannerTile(String url) => ImageUtil.networkImage(
        url: url,
        fit: BoxFit.cover,
      );

  Widget _buildSectionView({required String label, required Widget child}) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label.toText..style = Styles.ts_FFFFFF_20sp_semibold_sofia_pro,
            15.vSpace,
            child,
          ],
        ),
      );

  Widget _buildMostTrendingView() => _buildSectionView(
        label: StrRes.mostTrending,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _buildDetailedInfoTile(
              "https://picsum.photos/id/${index + 50}/1080/1920"),
          separatorBuilder: (BuildContext context, int index) => 20.vSpace,
          itemCount: 5,
        ),
      );

  Widget _buildVideoThumbnail({
    required String url,
    bool showLengthTime = true,
    bool showPreviewIcon = false,
    double? videoProgress,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: (IMUtils.isUrlValid(url))
                  ? ImageUtil.networkImage(
                      url: url,
                      fit: BoxFit.cover,
                    )
                  : ImageRes.thumbnailPlaceholder.toImage,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Styles.c_000000_opacity0,
                          Styles.c_000000_opacity95,
                          Styles.c_000000_opacity100,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.1, 0.9, 1.0],
                      ),
                    ),
                  ),
                  if (videoProgress != null)
                    _buildProgressView(
                      percent: videoProgress,
                    ),
                ],
              ),
            ),
            if (showLengthTime)
              Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ImageRes.playWhiteSmall.toImage
                        ..width = 10
                        ..height = 10,
                      "${58}m+".toText
                        ..style = Styles.ts_FFFFFF_12sp_semibold_sofia_pro,
                    ],
                  ),
                ),
              ),
            if (showPreviewIcon)
              Container(
                decoration: BoxDecoration(
                  color: Styles.c_000000_opacity65,
                  borderRadius: BorderRadius.circular(200),
                ),
                padding: const EdgeInsets.all(12),
                child: Transform.translate(
                  offset: const Offset(3, 0),
                  child: ImageRes.playWhite.toImage
                    ..width = 18
                    ..height = 18,
                ),
              ),
          ],
        ),
      );

  Widget _buildDetailedInfoTile(String url, [double tileHeight = 132]) =>
      SizedBox(
        height: tileHeight,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoThumbnail(url: url),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 7, top: 7, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    "The Double life of a Billionaire Heiress".toText
                      ..style = Styles.ts_FFFFFF_15sp_medium_sofia_pro,
                    3.vSpace,
                    "Love After Divource".toText
                      ..style = Styles.ts_8070F80_13sp_semibold_sofia_pro,
                    3.vSpace,
                    Expanded(
                      child:
                          "After three years of marriage, CEO Wes Sterling is convinced that his wife Kira is a cheating gold-digger. Fed up with the CEO.brain cancer, Ryder Van Woodsen brutally dumps the love of his life"
                              .toText
                            ..style = Styles.ts_8070F80_12sp_semibold_sofia_pro
                            ..maxLines = 3
                            ..overflow = TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildContinueWatchingView([double listHeight = 250]) =>
      _buildSectionView(
        label: StrRes.continueWatching,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildLastWatchedVideoTile(
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );

  Widget _buildLastWatchedVideoTile(
    String url, [
    double listHeight = 250,
    double tileWidth = 136,
  ]) =>
      SizedBox(
        height: listHeight,
        width: tileWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoThumbnail(
              url: url,
              showLengthTime: false,
              showPreviewIcon: true,
              videoProgress: 0.5,
            ),
            7.vSpace,
            "The Double Life of a Billionair Heiress".toText
              ..style = Styles.ts_FFFFFF_13sp_semibold_sofia_pro
              ..maxLines = 2
              ..overflow = TextOverflow.ellipsis,
            4.vSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "EP.${0}",
                      style: Styles.ts_D5495B_12sp_black_sofia_pro),
                  TextSpan(
                      text: " / ",
                      style: Styles.ts_8070F80_12sp_black_sofia_pro),
                  TextSpan(
                      text: "EP.${83}",
                      style: Styles.ts_8070F80_12sp_black_sofia_pro)
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildProgressView({required double percent}) => ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: LinearPercentIndicator(
          padding: EdgeInsets.zero,
          animation: true,
          animationDuration: 100,
          animateFromLastPercent: true,
          isRTL: false,
          lineHeight: 2,
          percent: percent,
          barRadius: const Radius.circular(0),
          backgroundColor: Styles.c_2E2E2E,
          progressColor: Styles.c_D5495B,
        ),
      );

  Widget _buildSimpleInfoTile(
    int index,
    String url, [
    double? listHeight,
    double tileWidth = 136,
  ]) {
    var infoTile = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVideoThumbnail(url: url),
        7.vSpace,
        (index % 2 == 0
                ? "We Are Never Ever Getting Back Together"
                : "Baby, Just Say Tes!")
            .toText
          ..style = Styles.ts_FFFFFF_13sp_semibold_sofia_pro
          ..maxLines = 2
          ..overflow = TextOverflow.ellipsis,
      ],
    );
    return listHeight != null
        ? SizedBox(height: listHeight, width: tileWidth, child: infoTile)
        : infoTile;
  }

  Widget _buildTopPickView([double listHeight = 240]) => _buildSectionView(
        label: StrRes.topPick,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildNewReleaseView([double listHeight = 240]) => _buildSectionView(
        label: StrRes.newRelease,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildHiddenIdentityView([double listHeight = 240]) =>
      _buildSectionView(
        label: StrRes.hiddenIdentity,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildLoveAtFirstSightView([double listHeight = 240]) =>
      _buildSectionView(
        label: StrRes.loveAtFirstSight,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildYoungLoveView([double listHeight = 240]) => _buildSectionView(
        label: StrRes.youngLove,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildToxicNTabooView([double listHeight = 240]) => _buildSectionView(
        label: StrRes.toxicNTaboo,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildWerewolfNVampireView([double listHeight = 240]) =>
      _buildSectionView(
        label: StrRes.werewolfNVampire,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );
  Widget _buildAsianStoriesView([double listHeight = 240]) => _buildSectionView(
        label: StrRes.asianStories,
        child: SizedBox(
          height: listHeight,
          child: RawScrollbar(
            // thumbVisibility: true,
            // trackVisibility: true,
            thickness: 5,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildSimpleInfoTile(
                  index,
                  "https://picsum.photos/id/${index + 50}/1080/1920",
                  listHeight),
              separatorBuilder: (BuildContext context, int index) => 15.hSpace,
              itemCount: 15,
            ),
          ),
        ),
      );

  Widget _buildMoreRecommendedView([double listHeight = 240]) =>
      _buildSectionView(
        label: StrRes.moreRecommended,
        child: MasonryGridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 15,
          itemCount: 15,
          itemBuilder: (context, index) =>
              LayoutBuilder(builder: (context, constraints) {
            Logger.print("creturn constraints $constraints");
            return _buildSimpleInfoTile(
              index,
              "https://picsum.photos/id/${index + 50}/1080/1920",
              null,
              constraints.maxWidth,
            );
          }),
        ),
      );
}
