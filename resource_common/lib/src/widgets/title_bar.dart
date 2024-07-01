import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({
    super.key,
    this.height,
    this.left,
    this.center,
    this.right,
    this.backgroundColor,
    this.showUnderline = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });
  final double? height;
  final Widget? left;
  final Widget? center;
  final Widget? right;
  final Color? backgroundColor;
  final bool showUnderline;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: backgroundColor ?? Styles.c_FFFFFF,
        padding: EdgeInsets.only(top: mq.padding.top),
        child: Container(
          height: height,
          padding: padding,
          decoration: showUnderline
              ? BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: Styles.c_E8EAEF, width: .5),
                  ),
                )
              : null,
          child: Row(
            children: [
              if (null != left) left!,
              if (null != center) center!,
              if (null != right) right!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 44);

  TitleBar.back({
    super.key,
    String? title,
    String? leftTitle,
    TextStyle? titleStyle,
    TextStyle? leftTitleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    this.right,
    this.showUnderline = false,
    Function()? onTap,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = Expanded(
          child: leftTitle == null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    (title ?? '').toText
                      ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                      ..textAlign = TextAlign.center,
                    Positioned(
                      left: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: onTap ?? (() => Get.back(result: result)),
                        child: Container(
                          color: Colors.transparent,
                          width: 80,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ImageRes.leftChevronBlack.toImage
                                ..width = 24
                                ..height = 24
                                ..color = backIconColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : ((title ?? '').toText
                ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                ..textAlign = TextAlign.center),
        ),
        left = leftTitle == null
            ? null
            : GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap ?? (() => Get.back(result: result)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageRes.leftChevronBlack.toImage
                      ..width = 24
                      ..height = 24
                      ..color = backIconColor,
                    leftTitle.toText
                      ..style =
                          (leftTitleStyle ?? Styles.ts_000000_16sp_medium),
                  ],
                ),
              );

  TitleBar.backLeftExpanded({
    super.key,
    String? leftTitle,
    TextStyle? leftTitleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    this.right,
    this.showUnderline = false,
    Function()? onTap,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = null,
        left = Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageRes.leftChevronBlack.toImage
                ..width = 24
                ..height = 24
                ..color = backIconColor
                ..onTap = onTap ?? (() => Get.back(result: result)),
              8.hSpace,
              if (null != leftTitle)
                Flexible(
                  child: leftTitle.trim().fixOverflowEllipsis.toText
                    ..style = (leftTitleStyle ?? Styles.ts_000000_16sp_medium)
                    ..maxLines = 1
                    ..overflow = TextOverflow.ellipsis
                    ..textAlign = TextAlign.left
                    ..onTap = onTap ?? (() => Get.back(result: result)),
                ),
            ],
          ),
        );

  TitleBar.backWithRightActionWidget({
    super.key,
    String? title,
    TextStyle? titleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    Widget? rightActionWidget,
    this.showUnderline = false,
    Function()? onTap,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            (title ?? '').toText
              ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
              ..textAlign = TextAlign.center,
            Positioned(
              left: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap ?? (() => Get.back(result: result)),
                child: Container(
                  color: Colors.transparent,
                  width: 80,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImageRes.leftChevronBlack.toImage
                        ..width = 24
                        ..height = 24
                        ..color = backIconColor,
                    ],
                  ),
                ),
              ),
            ),
            if (rightActionWidget != null)
              Positioned(
                right: 0,
                child: rightActionWidget,
              ),
          ],
        )),
        left = null,
        right = null;

  TitleBar.skip({
    super.key,
    String? title,
    String? leftTitle,
    TextStyle? titleStyle,
    TextStyle? leftTitleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    this.showUnderline = false,
    bool withBack = false,
    Function()? onTap,
    Function()? onSkip,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = Expanded(
          child: leftTitle == null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    (title ?? '').toText
                      ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                      ..textAlign = TextAlign.center,
                    if (withBack)
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: onTap ?? (() => Get.back(result: result)),
                          child: Container(
                            color: Colors.transparent,
                            width: 80,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ImageRes.leftChevronBlack.toImage
                                  ..width = 24
                                  ..height = 24
                                  ..color = backIconColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (onSkip != null)
                      Positioned(
                        right: 0,
                        child: StrRes.skip.capitalizeFirstLetterOnly.toText
                          ..style = Styles.ts_000000_16sp_medium
                          ..onTap = onSkip,
                      ),
                  ],
                )
              : ((title ?? '').toText
                ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                ..textAlign = TextAlign.center),
        ),
        left = null,
        right = null;

  TitleBar.search({
    super.key,
    String? hintText,
    TextEditingController? controller,
    FocusNode? focusNode,
    bool autofocus = true,
    Function(String)? onSubmitted,
    Function()? onCleared,
    ValueChanged<String>? onChanged,
  })  : height = 44,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = Styles.c_FFFFFF,
        center = Expanded(
          child: Container(
              child: SearchBox(
            enabled: true,
            autofocus: autofocus,
            hintText: hintText,
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            onCleared: onCleared,
            onChanged: onChanged,
          )),
        ),
        showUnderline = true,
        right = null,
        left = ImageRes.leftChevronBlack.toImage
          ..width = 24
          ..height = 24
          ..onTap = (() => Get.back());
}
