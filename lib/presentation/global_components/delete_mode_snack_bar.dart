import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

/// Use this as children of Stack which has Scaffold widget.
class DeleteModeSnackBar extends StatelessWidget {
  const DeleteModeSnackBar({
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
    return Positioned(
      left: 0, right: 0,
      bottom: 10,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: CustomColor.mainGreen),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 10,
                      color: Colors.grey,
                    )
                  ]),
              curve: Curves.easeOutCirc,
              height: height,
              alignment: Alignment.center,
              transform: transform,
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomColor.mainGreen,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
