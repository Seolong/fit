import 'package:flutter/material.dart';

/// Use this as children of Stack which has Scaffold widget.
class TopSnackBar extends StatelessWidget {
  const TopSnackBar({
    Key? key,
    required this.onTap,
    required this.height,
    required this.transform,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final VoidCallback? onTap;
  final double height;
  final Matrix4 transform;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCirc,
            color: Colors.white,
            height: height,
            alignment: Alignment.center,
            transform: transform,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                decoration: TextDecoration.none,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
