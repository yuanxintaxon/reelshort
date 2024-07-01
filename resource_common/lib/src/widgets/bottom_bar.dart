import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.index = 0,
    required this.items,
  });
  final int index;
  final List<BottomBarItem> items;

  bool _showDarkThemeBottomBar() => index == -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Styles.bottombar_height,
      decoration: BoxDecoration(
        color: (_showDarkThemeBottomBar()) ? Styles.c_000000 : Styles.c_000000,
        gradient: (_showDarkThemeBottomBar())
            ? LinearGradient(
                colors: [
                  Styles.c_000000_opacity0,
                  Styles.c_000000_opacity10,
                  Styles.c_000000_opacity38,
                  Styles.c_000000_opacity58,
                  Styles.c_000000_opacity65,
                  Styles.c_000000_opacity70,
                  Styles.c_000000_opacity75,
                  Styles.c_000000_opacity88,
                  Styles.c_000000_opacity95,
                  Styles.c_000000_opacity95,
                  Styles.c_000000_opacity95,
                  Styles.c_000000_opacity100,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        /*
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, -9), // Shadow offset
          ),
        ],
        */
      ),
      child: Row(
        children: List.generate(
          items.length,
          (index) => _buildItemView(
            i: index,
            item: items.elementAt(index),
          ),
        ).toList(),
      ),
    );
  }

  Widget _buildItemView({required int i, required BottomBarItem item}) =>
      Expanded(
        child: XGestureDetector(
          onDoubleTap: (_) => item.onDoubleClick?.call(i),
          onPointerDown: (_) => item.onClick?.call(i),
          child: Container(
            color:
                (_showDarkThemeBottomBar()) ? Styles.c_000000 : Styles.c_000000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.vSpace,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    (i == index
                        ? _showDarkThemeBottomBar()
                            ? item.selectedImgResDark.toImage
                            : item.selectedImgResLight.toImage
                        : _showDarkThemeBottomBar()
                            ? item.unselectedImgResDark.toImage
                            : item.unselectedImgResLight.toImage)
                      ..width = item.imgWidth
                      ..height = item.imgHeight,
                    if (item.useNotifDot &&
                        item.count != null &&
                        item.count! > 0) ...[
                      const Positioned(
                        top: -5,
                        right: -5,
                        child: NotificationDot(radius: 8),
                      ),
                    ] else if (!item.useNotifDot) ...[
                      Positioned(
                        top: -8,
                        right: -16,
                        child: UnreadCountView(
                          count: item.count ?? 0,
                          fontSize: 16,
                          size: 22,
                          horizontalPadding: 5.0,
                          radius: 20.0,
                          alwaysRectangle: true,
                        ),
                      ),
                    ]
                  ],
                ),
                4.vSpace,
                if (item.label != null)
                  item.label!.toText
                    ..style = i == index
                        ? (_showDarkThemeBottomBar()
                            ? item.selectedStyleDark ?? Styles.ts_FFFFFF_10sp
                            : item.selectedStyleLight ?? Styles.ts_000000_10sp)
                        : (_showDarkThemeBottomBar()
                            ? item.unselectedStyleDark ?? Styles.ts_FFFFFF_10sp
                            : item.unselectedStyleLight ??
                                Styles.ts_000000_10sp),
                30.vSpace,
              ],
            ),
          ),
        ),
        /*child: InkWell(
          onTap: () {
            if (item.onClick != null) item.onClick!(i);
          },
          onDoubleTap: () => item.onDoubleClick?.call(i),
          // behavior: HitTestBehavior.translucent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  (i == index
                      ? item.selectedImgRes.toImage
                      : item.unselectedImgRes.toImage)
                    ..width = item.imgWidth
                    ..height = item.imgHeight,
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: const Offset(2, -2),
                      child: UnreadCountView(count: item.count ?? 0),
                    ),
                  ),
                ],
              ),
              4.vSpace,
              item.label.toText
                ..style = i == index
                    ? (item.selectedStyle ?? Styles.ts_000000_10sp_semibold)
                    : (item.unselectedStyle ?? Styles.ts_8E9AB0_10sp_semibold),
            ],
          ),
        ),*/
      );
}

class BottomBarItem {
  final String selectedImgResDark;
  final String unselectedImgResDark;
  final String selectedImgResLight;
  final String unselectedImgResLight;
  final String? label;
  final TextStyle? selectedStyleDark;
  final TextStyle? unselectedStyleDark;
  final TextStyle? selectedStyleLight;
  final TextStyle? unselectedStyleLight;
  final double imgWidth;
  final double imgHeight;
  final Function(int index)? onClick;
  final Function(int index)? onDoubleClick;
  final Stream<int>? steam;
  final int? count;
  final bool useNotifDot;

  BottomBarItem(
      {required this.selectedImgResDark,
      required this.unselectedImgResDark,
      required this.selectedImgResLight,
      required this.unselectedImgResLight,
      this.label,
      this.selectedStyleDark,
      this.unselectedStyleDark,
      this.selectedStyleLight,
      this.unselectedStyleLight,
      required this.imgWidth,
      required this.imgHeight,
      this.onClick,
      this.onDoubleClick,
      this.steam,
      this.count,
      this.useNotifDot = false});
}
