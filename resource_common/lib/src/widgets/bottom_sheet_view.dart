import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({
    super.key,
    required this.items,
    this.itemHeight,
    this.textStyle,
    this.cancelTextStyle,
    this.mainAxisAlignment,
    this.isOverlaySheet = false,
    this.onCancel,
  });
  final List<SheetItem> items;
  final double? itemHeight;
  final TextStyle? textStyle;
  final TextStyle? cancelTextStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final bool isOverlaySheet;
  final Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: items.map(_parseItem).toList(),
              ),
            ),
            _itemBgView(
              textStyle: cancelTextStyle,
              label: StrRes.cancel,
              onTap: isOverlaySheet ? onCancel : () => Get.back(),
              borderRadius: BorderRadius.circular(0),
              alignment: MainAxisAlignment.center,
            ),
            Container(
              color: Styles.c_FFFFFF,
              height: kBottomNavigationBarHeight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _parseItem(SheetItem item) {
    BorderRadius? borderRadius;
    int length = items.length;
    bool isLast = items.indexOf(item) == items.length - 1;
    bool isFirst = items.indexOf(item) == 0;
    if (length == 1) {
      borderRadius = item.borderRadius ?? BorderRadius.circular(0);
    } else {
      borderRadius = item.borderRadius ??
          BorderRadius.only(
            topLeft: isFirst ? const Radius.circular(0) : Radius.zero,
            topRight: isFirst ? const Radius.circular(0) : Radius.zero,
            bottomLeft: isLast ? const Radius.circular(0) : Radius.zero,
            bottomRight: isLast ? const Radius.circular(0) : Radius.zero,
          );
    }
    return _itemBgView(
        label: item.label,
        textStyle: item.textStyle,
        icon: item.icon,
        alignment: item.alignment,
        // line: !isLast,
        line: true,
        borderRadius: borderRadius,
        onTap: () {
          if (!isOverlaySheet) Get.back(result: item.result);
          item.onTap?.call();
        });
  }

  Widget _itemBgView({
    required String label,
    String? icon,
    Function()? onTap,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    MainAxisAlignment? alignment,
    bool line = false,
  }) =>
      Ink(
        decoration: BoxDecoration(
          color: Styles.c_FFFFFF,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: line
                ? BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(color: Styles.c_E8EAEF, width: 0.5),
                    ),
                  )
                : null,
            height: itemHeight ?? 56,
            child: Row(
              mainAxisAlignment:
                  alignment ?? mainAxisAlignment ?? MainAxisAlignment.center,
              children: [
                if (null != icon) 10.hSpace,
                if (null != icon) _image(icon),
                if (null != icon) 5.hSpace,
                _text(label, textStyle),
              ],
            ),
          ),
        ),
      );

  _text(String label, TextStyle? style) =>
      label.toText..style = (style ?? textStyle ?? Styles.ts_0C1C33_17sp);

  _image(String icon) => icon.toImage
    ..width = 24
    ..height = 24;
}

class SheetItem {
  final String label;
  final TextStyle? textStyle;
  final String? icon;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final MainAxisAlignment? alignment;
  final dynamic result;

  SheetItem({
    required this.label,
    this.textStyle,
    this.icon,
    this.onTap,
    this.borderRadius,
    this.alignment,
    this.result,
  });
}
