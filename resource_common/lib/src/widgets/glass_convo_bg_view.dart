import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resource_common.dart';

class GlassConvoBgView extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;

  const GlassConvoBgView({this.child, this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (backgroundColor != null) ? backgroundColor : Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          // ImageRes.homeBg.toImageFitCover,
          _buildGlassPane(),
        ],
      ),
    );
  }

  Widget _buildGlassPane() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  /*
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.5), // Adjust color and opacity
                      spreadRadius: 5, // Adjust spread radius
                      blurRadius: 7, // Adjust blur radius
                      offset: Offset(0, 3), // Adjust position of the shadow
                    ),
                  ],
                  */
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(0),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.3),
                      ])),
            ),
            if (child != null) child!
          ],
        ),
      ),
    );
  }
}
