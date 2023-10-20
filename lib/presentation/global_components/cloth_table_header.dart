import 'dart:ui';

import 'package:flutter/material.dart';

import '../../util/colors.dart';

class ClothTableHeader extends StatelessWidget {
  const ClothTableHeader({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
            color: CustomColor.skyBlue,
          ),
          child: child,
        ),
        Positioned(
            child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: 10,
              width: double.infinity,
              color: Colors.black.withOpacity(0),
            ),
          ),
        ))
      ],
    );
  }
}

class ClothTableHeaderText extends StatelessWidget {
  const ClothTableHeaderText({
    Key? key,
    required this.fontSize,
    required this.text,
  }) : super(key: key);

  final double fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    );
  }
}

class ClothTableHeaderDivider extends StatelessWidget {
  const ClothTableHeaderDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Colors.white,
      thickness: 1.5,
      indent: 18,
      endIndent: 18,
    );
  }
}
