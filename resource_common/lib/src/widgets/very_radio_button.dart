import 'package:flutter/material.dart';

class VeryRadioButton extends StatelessWidget {
  const VeryRadioButton({
    super.key,
    required this.selected,
    required this.enabledColor,
    required this.disabledColor,
    this.width = 20,
    this.height = 20,
    this.innerWidth = 15,
    this.innerHeight = 15,
    this.borderThickness,
  });

  final bool selected;
  final Color enabledColor;
  final Color disabledColor;
  final double? width;
  final double? height;
  final double? innerWidth;
  final double? innerHeight;
  final double? borderThickness;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selected ? enabledColor : disabledColor,
              width: borderThickness ?? 1.0,
            ),
          ),
        ),
        if (selected)
          Container(
            width: innerWidth,
            height: innerHeight,
            decoration: BoxDecoration(
              color: selected ? enabledColor : null,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
