import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToClothCategoryRouteButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final double _borderRadius = 10;

  const ToClothCategoryRouteButton({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 125,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadius),
        onPressed: onTap,
        child: Text(
          name,
          textScaleFactor: 1.0,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Ink(
// decoration: BoxDecoration(
// gradient: const LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [
// CustomColor.lightBlue,
// CustomColor.deepBlue,
// ],
// ),
// borderRadius: BorderRadius.circular(_borderRadius)),
// height: 100,
// width: 100,
// child: InkWell(
// borderRadius: BorderRadius.circular(_borderRadius),
// onTap: onTap,
// child: Center(
// child: Text(
// name,
// style: const TextStyle(
// fontSize: 26,
// color: Colors.white,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// );