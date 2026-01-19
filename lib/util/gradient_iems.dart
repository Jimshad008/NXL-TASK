import 'package:flutter/material.dart';

import '../app/palette.dart';

class GradientItems extends StatelessWidget {
  final Widget child;
  final bool gradient;
  const GradientItems({super.key,required this.child,this.gradient=false});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) => gradient?LinearGradient(colors: [
          Color(0xff9095A1),
          Color(0xff9095A1),
          Color(0xff9095A1),

        ]).createShader(bounds): LinearGradient(
          colors: [
            Palette.gradient2begin,
            Palette.gradient2mid,
            Palette.gradient2end,
          ],
        ).createShader(bounds),
        child: child);
  }
}
