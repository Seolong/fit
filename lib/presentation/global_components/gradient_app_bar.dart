import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({
    Key? key,
    required this.center,
    required this.end,
    this.height,
    this.alignment,
    this.padding,
  }) : super(key: key);

  final Widget center;
  final Widget end;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;

  Widget getPlatformSizedBox() {
    if (Platform.isIOS) {
      return const SizedBox(
        height: 40,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  double getHeight() {
    double platformHeight =
        Platform.isIOS ? 100 : AppBar().preferredSize.height + 10;
    return height ?? platformHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      height: getHeight(),
      decoration: const BoxDecoration(
          color: Colors.white, gradient: CustomLinearGradient.mainGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          getPlatformSizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                center,
                end,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
