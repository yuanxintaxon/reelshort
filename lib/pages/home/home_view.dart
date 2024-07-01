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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselView() => Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                onPageChanged: (index, reason) => logic.updateIndex(index),
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
                height: 160,
                enableInfiniteScroll: true,
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
        ),
      );

  Widget _buildImageBannerTile(String url) => ImageUtil.networkImage(
        url: url,
        fit: BoxFit.cover,
      );

  Widget _buildNavbarView() => Container(
        height: 200,
        decoration: BoxDecoration(color: Styles.c_2E2E2E),
      );
}
