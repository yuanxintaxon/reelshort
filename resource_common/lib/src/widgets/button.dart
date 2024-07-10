import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:resource_common/resource_common.dart';
import 'package:sprintf/sprintf.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.enabled = true,
    this.enabledColor,
    this.disabledColor,
    this.radius,
    this.border,
    this.textStyle,
    this.disabledTextStyle,
    this.onTap,
    this.onTapWhenDisabled,
    this.onDoubleTap,
    this.height,
    this.margin,
    this.padding,
    this.gradient,
    this.boxShadow,
  });
  final Color? enabledColor;
  final Color? disabledColor;
  final double? radius;
  final Border? border;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final String text;
  final double? height;
  final Function()? onTap;
  final Function()? onTapWhenDisabled;
  final Function()? onDoubleTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: enabled ? onTap : onTapWhenDisabled,
          onDoubleTap: enabled ? onDoubleTap : null,
          borderRadius: BorderRadius.circular(radius ?? 4),
          child: Ink(
            height: height ?? 44,
            decoration: BoxDecoration(
              color: enabled
                  ? enabledColor ?? Styles.c_000000
                  : disabledColor ?? Styles.c_000000_opacity50,
              borderRadius: BorderRadius.circular(radius ?? 4),
              gradient: (gradient != null) ? gradient : null,
              border: (border != null) ? border : null,
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: (boxShadow != null) ? boxShadow : null,
              ),
              padding: padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text.toText
                    ..maxLines = 1
                    ..overflow = TextOverflow.ellipsis
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_FFFFFF_17sp_semibold
                        : (enabled)
                            ? textStyle ?? Styles.ts_FFFFFF_17sp_semibold
                            : disabledTextStyle ??
                                Styles.ts_FFFFFF_17sp_semibold,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageTextButton extends StatelessWidget {
  const ImageTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.radius,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.onTap,
    this.onTapWhenDisabled,
  });
  final String icon;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Function()? onTap;
  final Function()? onTapWhenDisabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: enabled ? onTap : onTapWhenDisabled,
        borderRadius: BorderRadius.circular(radius ?? 6),
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 6),
            color: (disabledTextStyle == null)
                ? enabled
                    ? enabledColor ?? Styles.c_000000
                    : disabledColor ?? Styles.c_000000_opacity50
                : enabledColor ?? Styles.c_000000,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  6.hSpace,
                  (disabledIcon == null)
                      ? (icon.toImage
                        ..width = 20
                        ..height = 20)
                      : (enabled)
                          ? (icon.toImage
                            ..width = 20
                            ..height = 20)
                          : (disabledIcon!.toImage
                            ..width = 20
                            ..height = 20),
                ] else ...[
                  (disabledIcon == null)
                      ? (icon.toImage
                        ..width = 20
                        ..height = 20)
                      : (enabled)
                          ? (icon.toImage
                            ..width = 20
                            ..height = 20)
                          : (disabledIcon!.toImage
                            ..width = 20
                            ..height = 20),
                  6.hSpace,
                  text.toText..style = textStyle ?? Styles.ts_0C1C33_17sp,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedImageTextButton extends StatelessWidget {
  const ExpandedImageTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize,
    this.iconTextGap,
    this.iconBottomPadding,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.radius,
    this.height,
    this.padding = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.enabled = true,
    this.onTap,
  });
  final String icon;
  final double? iconSize;
  final double? iconTextGap;
  final double? iconBottomPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment mainAxisAlignment;
  final bool enabled;
  final Function()? onTap;

  ExpandedImageTextButton.signInWithGoogle({super.key, this.onTap})
      : icon = ImageRes.google,
        text = sprintf(StrRes.signInWithX, [StrRes.google]),
        iconSize = 28,
        iconTextGap = 20,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_547DE6,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_FFFFFF_17sp_semibold_sofia_pro,
        disabledTextStyle = null,
        height = 48,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.signInWithFacebook({super.key, this.onTap})
      : icon = ImageRes.facebook,
        text = sprintf(StrRes.signInWithX, [StrRes.facebook]),
        iconSize = 28,
        iconTextGap = 20,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_4769B2,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_FFFFFF_17sp_semibold_sofia_pro,
        disabledTextStyle = null,
        height = 48,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.signInWithApple({super.key, this.onTap})
      : icon = ImageRes.apple,
        text = sprintf(StrRes.signInWithX, [StrRes.apple]),
        iconSize = 28,
        iconTextGap = 20,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_FFFFFF,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_000000_17sp_semibold_sofia_pro,
        disabledTextStyle = null,
        height = 48,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        height: height ?? 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 6),
          color: (disabledTextStyle == null)
              ? enabled
                  ? enabledColor ?? Styles.c_000000
                  : disabledColor ?? Styles.c_000000_opacity50
              : enabledColor ?? Styles.c_000000,
        ),
        child: InkWell(
          onTap: (enabled) ? onTap : null,
          borderRadius: BorderRadius.circular(radius ?? 6),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                if (iconTrailing == true) ...[
                  Flexible(
                    child: text.fixOverflowEllipsis.toText
                      ..overflow = TextOverflow.ellipsis
                      ..maxLines = 1
                      ..style = (disabledTextStyle == null)
                          ? textStyle ?? Styles.ts_0C1C33_17sp
                          : (enabled)
                              ? textStyle ?? Styles.ts_0C1C33_17sp
                              : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  ),
                  (iconTextGap ?? 6).hSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (disabledIcon == null)
                          ? (icon.toImage
                            ..width = iconSize ?? 20
                            ..height = iconSize ?? 20)
                          : (enabled)
                              ? (icon.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20)
                              : (disabledIcon!.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20),
                      if (iconBottomPadding != null) iconBottomPadding!.vSpace,
                    ],
                  ),
                ] else ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (disabledIcon == null)
                          ? (icon.toImage
                            ..width = iconSize ?? 20
                            ..height = iconSize ?? 20)
                          : (enabled)
                              ? (icon.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20)
                              : (disabledIcon!.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20),
                      if (iconBottomPadding != null) iconBottomPadding!.vSpace,
                    ],
                  ),
                  (iconTextGap ?? 6).hSpace,
                  Flexible(
                      child: text.fixOverflowEllipsis.toText
                        ..overflow = TextOverflow.ellipsis
                        ..maxLines = 1
                        ..style = textStyle ?? Styles.ts_0C1C33_17sp),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageTwoLineTextButton extends StatelessWidget {
  const ImageTwoLineTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.iconTrailing = false,
    this.iconOpacity = 1.0,
    this.textStyle,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.onTap,
  });
  final String icon;
  final double iconOpacity;
  final String text;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius ?? 6),
        child: Ink(
          height: height ?? 46,
          width: width ?? 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 6),
            color: color,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  Expanded(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 2
                      ..overflow = TextOverflow.ellipsis,
                  ),
                  6.hSpace,
                  icon.toImage
                    ..width = 20
                    ..height = 20
                    ..opacity = iconOpacity,
                ] else ...[
                  icon.toImage
                    ..width = 20
                    ..height = 20
                    ..opacity = iconOpacity,
                  6.hSpace,
                  Expanded(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 2
                      ..overflow = TextOverflow.ellipsis,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.icon,
    this.disabledIcon,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.onTap,
  });
  final String icon;
  final String? disabledIcon;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: (disabledIcon == null)
                ? (icon.toImage
                  ..width = 29.55
                  ..height = 19)
                : (enabled)
                    ? (icon.toImage
                      ..width = 29.55
                      ..height = 19)
                    : (disabledIcon!.toImage
                      ..width = 29.55
                      ..height = 19),
          ),
        ),
      ),
    );
  }
}

class GradientTextButton extends StatelessWidget {
  const GradientTextButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.border,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Border? border;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                ] else ...[
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                  if (icon != null) 6.hSpace,
                  text.toText..style = textStyle ?? Styles.ts_0C1C33_17sp,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextBorderButton extends StatelessWidget {
  const GradientTextBorderButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp
                    ..maxLines = 1,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    (disabledIcon == null && icon != null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                ] else ...[
                  if (icon != null)
                    (disabledIcon == null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                  if (icon != null) 6.hSpace,
                  text.toText
                    ..style = textStyle ?? Styles.ts_0C1C33_17sp
                    ..maxLines = 1,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextBorderFixWidthButton extends StatelessWidget {
  const GradientTextBorderFixWidthButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          width: width,
          height: height ?? 46,
          decoration: BoxDecoration(
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  Flexible(
                    child: text.toText
                      ..style = (disabledTextStyle == null)
                          ? textStyle ?? Styles.ts_0C1C33_17sp
                          : (enabled)
                              ? textStyle ?? Styles.ts_0C1C33_17sp
                              : disabledTextStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 1
                      ..textAlign = TextAlign.center,
                  ),
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    (disabledIcon == null && icon != null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                ] else ...[
                  if (icon != null)
                    (disabledIcon == null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                  if (icon != null) 6.hSpace,
                  Flexible(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 1
                      ..textAlign = TextAlign.center,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedGradientTextBorderButton extends StatelessWidget {
  const ExpandedGradientTextBorderButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 6),
          topRight: Radius.circular(topRightRadius ?? 6),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
          bottomRight: Radius.circular(bottomRightRadius ?? 6),
        ),
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            color: enabledColor,
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: enabledColor != null ? null : gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp
                    ..maxLines = 1
                    ..overflow = TextOverflow.ellipsis,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                ] else ...[
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                  if (icon != null) 6.hSpace,
                  Flexible(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 1
                      ..overflow = TextOverflow.ellipsis,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextBorderSquareButton extends StatelessWidget {
  const GradientTextBorderSquareButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          width: width ?? 46,
          decoration: BoxDecoration(
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                ] else ...[
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                  if (icon != null) 6.hSpace,
                  text.toText..style = textStyle ?? Styles.ts_0C1C33_17sp,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
