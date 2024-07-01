import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';

class UnreadCountView extends StatelessWidget {
  const UnreadCountView({
    super.key,
    this.count = 0,
    this.size = 13, // height
    this.fontSize = 8,
    this.margin,
    this.horizontalPadding,
    this.radius,
    this.alwaysRectangle = false,
  });
  final int count;
  final double size;
  final double fontSize;
  final EdgeInsetsGeometry? margin;
  final double? horizontalPadding;
  final double? radius;
  final bool alwaysRectangle;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: count > 0,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        padding: count > 99
            ? EdgeInsets.symmetric(
                horizontal:
                    horizontalPadding != null ? (horizontalPadding! + 8) : 8)
            : EdgeInsets.symmetric(
                horizontal:
                    horizontalPadding != null ? (horizontalPadding!) : 0),
        constraints: BoxConstraints(maxHeight: size, minWidth: size),
        decoration: _decoration,
        child: _text,
      ),
    );
  }

  Text get _text => Text(
        '${count > 99 ? '99+' : count}',
        style: TextStyle(
          fontSize: fontSize,
          color: const Color(0xFFFFFFFF),
        ),
        textAlign: TextAlign.center,
      );

  Decoration get _decoration => BoxDecoration(
        color: Styles.c_F34F67,
        shape: alwaysRectangle
            ? BoxShape.rectangle
            : count > 99
                ? BoxShape.rectangle
                : BoxShape.circle,
        borderRadius: alwaysRectangle
            ? BorderRadius.circular(radius ?? 10)
            : count > 99
                ? BorderRadius.circular(radius ?? 10)
                : null,
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
      );
}
