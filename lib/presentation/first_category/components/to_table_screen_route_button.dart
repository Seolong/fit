import 'package:flutter/material.dart';

class ToTableScreenRouteButton extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;

  const ToTableScreenRouteButton({
    Key? key,
    this.width = 125,
    this.height = 100,
    required this.child,
  }) : super(key: key);

  @override
  State<ToTableScreenRouteButton> createState() =>
      _ToTableScreenRouteButtonState();
}

class _ToTableScreenRouteButtonState extends State<ToTableScreenRouteButton> {
  final Color _notPressedBackgroundColor = Colors.white;
  final Color _pressedBackgroundColor = Colors.grey;
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = _notPressedBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onLongPress: () {},
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
