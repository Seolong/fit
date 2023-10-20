import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class ClothTableRowContent extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool isLongPressed;
  final Widget child;

  const ClothTableRowContent({
    super.key,
    required this.onTap,
    required this.onLongPress,
    required this.isLongPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: AnimatedContainer(
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: CustomColor.skyBlue))),
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.translationValues(isLongPressed ? 65 : 0, 0, 0),
        child: child,
      ),
    );
  }
}
