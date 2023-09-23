import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  GradientWidget({
    super.key,
    required this.widget,
    required this.gradient,
    this.color = Colors.white,
    required this.width,
    required this.height,
  });

  final Widget widget;
  final double width;
  final double height;
  final Gradient gradient;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: width,
        height: height,
        child: widget,
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, width, height);
        return gradient.createShader(rect);
      },
    );
  }
}
