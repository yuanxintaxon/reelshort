import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';

class VeryCheckbox extends StatelessWidget {
  const VeryCheckbox({
    super.key,
    required this.selected,
    required this.enabledIcon,
    required this.disabledIcon,
    this.width = 20,
    this.height = 20,
  });

  final bool selected;
  final String enabledIcon;
  final String disabledIcon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        (selected
                ? ImageRes.checkboxCheckedBlack
                : ImageRes.checkboxUncheckedBlack)
            .toImage
          ..width = width
          ..height = height,
      ],
    );
  }
}
