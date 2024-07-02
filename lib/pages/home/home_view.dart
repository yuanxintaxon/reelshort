import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

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

  Widget _buildVideoThumbnail(
          {required String url, double height = 132, double width = 110}) =>
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: ImageUtil.networkImage(
              url: url,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 36,
            width: width,
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
          Padding(
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
        ],
      );

  Widget _buildDetailedInfoTile(String url) => Container(
        height: 132,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoThumbnail(url: url, height: 140),
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
}
