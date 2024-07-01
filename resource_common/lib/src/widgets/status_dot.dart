import 'package:flutter/material.dart';

import '../../veryreal_common.dart'; // Import your styles file

class StatusDot extends StatelessWidget {
  const StatusDot({
    super.key,
    required this.isOnline,
    // required this.color,
    this.radius = 3.5,
    this.marginLeft = 0,
    this.marginRight = 0,
  });

  final bool isOnline;
  // final Color color;
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
        color: isOnline ? Styles.c_22C127 : Styles.c_8E9AB0,
      ),
    );
  }
}
