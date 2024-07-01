import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';
import 'package:uuid/uuid.dart';

typedef CustomAvatarBuilder = Widget? Function();

class AvatarView extends StatelessWidget {
  const AvatarView({
    super.key,
    this.showAvatar = true,
    this.width,
    this.height,
    this.onTap,
    this.url,
    this.sourcePath,
    this.builder,
    this.text,
    this.textStyle,
    this.onLongPress,
    this.isCircle = true,
    this.color,
    this.gradient,
    this.padding,
    this.borderRadius,
    this.enabledPreview = false,
    this.lowMemory = false,
    this.nineGridUrl = const [],
    this.isGroup = false,
    this.isPublicGroup,
    this.showDefaultAvatar = true,
    this.boxShadow = const [],
    this.boxShadowOffset = 0.0,
  });
  final bool showAvatar;
  final double? width;
  final double? height;
  final Function()? onTap;
  final Function()? onLongPress;
  final String? url;
  final String? sourcePath;
  final CustomAvatarBuilder? builder;
  final bool isCircle;
  final Color? color;
  final Gradient? gradient;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final bool enabledPreview;
  final String? text;
  final TextStyle? textStyle;
  final bool lowMemory;
  final List<String> nineGridUrl;
  final bool isGroup;
  final bool? isPublicGroup;
  final bool showDefaultAvatar;
  final List<BoxShadow> boxShadow;
  final double boxShadowOffset;

  double get _avatarSize => min((width ?? 40), height ?? 40);

  TextStyle get _textStyle => textStyle ?? Styles.ts_FFFFFF_16sp;

  Color get _textAvatarBgColor => Styles.c_000000;

  String? get _showName {
    if (isGroup) return null;
    if (text != null && text!.trim().isNotEmpty) {
      return text!.substring(0, 1);
    }
    return null;
  }

  bool get isUrlValid => IMUtils.isUrlValid(url);

  @override
  Widget build(BuildContext context) {
    var tag = const Uuid().v4();
    var child = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap ??
          ((enabledPreview && isUrlValid)
              ? () => IMUtils.previewUrlPicture([MediaSource(url!, url!)])
              : null),
      onLongPress: onLongPress,
      child: (boxShadow.isNotEmpty) ? _boxShadowAvatar() : _finalAvatar(),
    );
    return Hero(tag: tag, child: child);
  }

  Widget _boxShadowAvatar() => Container(
        padding: EdgeInsets.all(boxShadowOffset),
        child: Container(
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            boxShadow: boxShadow,
          ),
          child: _finalAvatar(),
        ),
      );

  Widget _finalAvatar() =>
      builder?.call() ??
      FittedBox(
        fit: BoxFit.cover,
        child: isCircle
            ? ClipOval(
                child: Container(
                  padding: isPublicGroup != null
                      ? const EdgeInsets.all(5.0)
                      : padding,
                  decoration: BoxDecoration(
                    color: isPublicGroup != null
                        ? isPublicGroup == true
                            ? null
                            : Colors.transparent
                        : color,
                    gradient: isPublicGroup != null
                        ? isPublicGroup == true
                            ? Styles.linear_gradient_DFCC92_F9F3E1_B09968
                            : null
                        : gradient,
                  ),
                  child: ClipOval(
                    child: showAvatar
                        ? nineGridUrl.isNotEmpty
                            ? _nineGridAvatar()
                            : _normalAvatar()
                        : _noAvatar(),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.circular(2),
                child: Container(
                  padding: padding,
                  decoration: BoxDecoration(
                    color: color,
                    gradient: gradient,
                  ),
                  child: ClipRRect(
                    child: showAvatar
                        ? nineGridUrl.isNotEmpty
                            ? _nineGridAvatar()
                            : _normalAvatar()
                        : _noAvatar(),
                  ),
                ),
              ),
      );

  Widget _noAvatar() => SizedBox(
        width: _avatarSize,
        height: _avatarSize,
      );

  Widget _normalAvatar() => (sourcePath != null && sourcePath!.isNotEmpty)
      ? _localImageAvatar()
      : !isUrlValid
          ? _textAvatar()
          : _networkImageAvatar();

  Widget _textAvatar() => Container(
        width: _avatarSize,
        height: _avatarSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _textAvatarBgColor,
        ),
        child: null == _showName
            ? (showDefaultAvatar
                ? !isGroup
                    ? (ImageRes.defaultUserAvatar.toImage
                      ..width = _avatarSize / 3
                      ..height = _avatarSize / 3)
                    : (ImageRes.defaultUserAvatar.toImage
                      ..width = _avatarSize / 3
                      ..height = _avatarSize / 3)
                : null)
            : Text(_showName!, style: _textStyle),
      );

  Widget _localImageAvatar() {
    return kIsWeb
        ? Image.network(sourcePath!)
        : Image.file(
            File(sourcePath!),
            width: _avatarSize,
            height: _avatarSize,
            fit: BoxFit.cover,
          );
  }

  Widget _networkImageAvatar() => ImageUtil.networkImage(
        url: url!,
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.cover,
        lowMemory: lowMemory,
        loadProgress: false,
        errorWidget: _textAvatar(),
      );

  Widget _nineGridAvatar() => Container(
        width: _avatarSize,
        height: _avatarSize,
        color: Colors.grey[300],
        padding: const EdgeInsets.all(2.0),
        alignment: Alignment.center,
        child: _nineGridColumn(),
      );

  /// 9宫格列
  Widget _nineGridColumn() {
    double width = 0.0;
    double margin = 2.0;
    int row1Length = 0;
    int row2Length = 0;
    int row3Length = 0;
    var list = <Widget>[];
    switch (nineGridUrl.length) {
      case 1:
        width = _avatarSize;
        row1Length = 1;
        break;
      case 2:
        width = _avatarSize / 2;
        row1Length = 2;
        break;
      case 3:
        width = _avatarSize / 2;
        row1Length = 1;
        row2Length = 2;
        break;
      case 4:
        width = _avatarSize / 2;
        row1Length = 2;
        row2Length = 2;
        break;
      case 5:
        width = _avatarSize / 3;
        row1Length = 2;
        row2Length = 3;
        break;
      case 6:
        width = _avatarSize / 3;
        row1Length = 3;
        row2Length = 3;
        break;
      case 7:
        width = _avatarSize / 3;
        row1Length = 1;
        row2Length = 3;
        row3Length = 3;
        break;
      case 8:
        width = _avatarSize / 3;
        row1Length = 2;
        row2Length = 3;
        row3Length = 3;
        break;
      case 9:
        width = _avatarSize / 3;
        row1Length = 3;
        row2Length = 3;
        row3Length = 3;
        break;
    }
    if (row1Length > 0) {
      list.add(_nineGridRow(
        length: row1Length,
        start: 0,
        size: width,
        margin: margin,
      ));
    }
    if (row2Length > 0) {
      list.add(_nineGridRow(
        length: row2Length,
        start: row1Length,
        size: width,
        margin: margin,
      ));
    }
    if (row3Length > 0) {
      list.add(_nineGridRow(
        length: row3Length,
        start: row1Length + row2Length,
        size: width,
        margin: margin,
      ));
    }
    return Column(
      children: list,
    );
  }

  /// 9宫格行
  Widget _nineGridRow({
    required int length,
    required int start,
    required double size,
    required double margin,
  }) {
    Widget nineGridImage(String? url, double size) => _normalAvatar();
    Widget nineGridLine({
      double? width,
      double? height,
    }) =>
        Container(height: height, width: width, color: Colors.white);
    var list = <Widget>[];
    for (var i = 0; i < length; i++) {
      start += i;
      list.add(nineGridImage(nineGridUrl.elementAt(start), size));
      if (i != length - 1) {
        list.add(nineGridLine(width: margin, height: size));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}

class RedDotView extends StatelessWidget {
  const RedDotView({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Styles.c_FF381F,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color(0x26C61B4A),
              offset: Offset(1.15, 1.15),
              blurRadius: 57.58,
            ),
            BoxShadow(
              color: Color(0x1AC61B4A),
              offset: Offset(2.3, 2.3),
              blurRadius: 11.52,
            ),
            BoxShadow(
              color: Color(0x0DC61B4A),
              offset: Offset(4.61, 4.61),
              blurRadius: 17.28,
            ),
          ],
        ),
      );
}
