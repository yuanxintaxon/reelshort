import 'package:flutter/material.dart';

import '../../resource_common.dart'; // Import your styles file

class NotificationDot extends StatelessWidget {
  const NotificationDot({
    super.key,
    this.color,
    this.radius = 3.5,
    this.marginLeft = 0,
    this.marginRight = 0,
  });

  final Color? color;
  final double radius;
  final double marginLeft;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Styles.c_F34F67,
      ),
    );
  }
}
