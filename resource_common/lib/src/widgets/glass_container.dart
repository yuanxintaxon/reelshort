import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    this.hasBorder = false,
    this.color = Colors.white,
    this.blurSigma = 5.0,
    required this.child,
  });

  final bool hasBorder;
  final Color color;
  final double blurSigma;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _buildGlassChatBgView(context);
  }

  Widget _buildGlassChatBgView(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;

    double maxW = screenW * 1.5;
    double maxH = screenH * 1.5;

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  border: hasBorder
                      ? Border.all(color: Colors.white.withOpacity(0.2))
                      : null, // Conditionally add the border
                  borderRadius: BorderRadius.circular(0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        color.withOpacity(0.1),
                        color.withOpacity(0.3),
                        color.withOpacity(0.7),
                      ])),
            ),
            Container(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
