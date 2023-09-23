import 'package:fit/presentation/global_components/gradient_widget.dart';
import 'package:fit/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToClothCategoryRouteButton extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const ToClothCategoryRouteButton(
      {Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  State<ToClothCategoryRouteButton> createState() =>
      _ToClothCategoryRouteButtonState();
}

class _ToClothCategoryRouteButtonState
    extends State<ToClothCategoryRouteButton> {
  final double _borderRadius = 10;
  Gradient mainGradient = const LinearGradient(
    colors: <Color>[
      CustomColor.mainGreen,
      CustomColor.mainBlue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  Gradient subGradient = const LinearGradient(
    colors: <Color>[
      Colors.white,
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  Gradient buttonGradient = const LinearGradient(
    colors: <Color>[
      Colors.white,
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  Gradient iconGradient = const LinearGradient(
    colors: <Color>[
      CustomColor.mainGreen,
      CustomColor.mainBlue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
      },
      onTapDown: (detail) {
        setState(() {
          buttonGradient = mainGradient;
          iconGradient = subGradient;
        });
      },
      onTapUp: (detail) {
        setState(() {
          buttonGradient = subGradient;
          iconGradient = mainGradient;
        });
      },
      onTapCancel: () {
        setState(() {
          buttonGradient = subGradient;
          iconGradient = mainGradient;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: Colors.white,
          gradient: buttonGradient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350]!,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, 3), // shadow direction: bottom right
            )
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientWidget(
                widget: Icon(
                  Icons.access_time_filled,
                  size: 50,
                  color: Colors.white,
                ),
                gradient: iconGradient,
                width: 50,
                height: 50,
              ),
              GradientWidget(
                widget: Text(
                  widget.name,
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gradient: iconGradient,
                width: 100,
                height: 30,
              ),
            ],
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
