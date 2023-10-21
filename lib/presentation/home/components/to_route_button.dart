import 'package:fit/presentation/global_components/gradient_widget.dart';
import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class ToRouteButton extends StatefulWidget {
  final String name;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final Widget? center;

  const ToRouteButton(
      {Key? key, required this.name, required this.onTap, this.center, this.onLongPress})
      : super(key: key);

  @override
  State<ToRouteButton> createState() =>
      _ToRouteButtonState();
}

class _ToRouteButtonState
    extends State<ToRouteButton> {
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
      onLongPress: widget.onLongPress,
      onLongPressEnd: widget.onLongPress != null ? (_) {
        setState(() {
          buttonGradient = subGradient;
          iconGradient = mainGradient;
        });
      }: null,
      onLongPressCancel: widget.onLongPress != null ? () {
        setState(() {
          buttonGradient = subGradient;
          iconGradient = mainGradient;
        });
      }: null,
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
              widget.center ?? GradientWidget(
                widget: const Icon(
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