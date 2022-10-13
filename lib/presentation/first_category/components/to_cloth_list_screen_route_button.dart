import 'package:flutter/material.dart';

class ToClothListScreenRouteButton extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const ToClothListScreenRouteButton({
    Key? key,
    this.width = 150,
    this.height = 125,
    required this.child,
    required this.onTap, required this.onLongPress,
  }) : super(key: key);

  @override
  State<ToClothListScreenRouteButton> createState() =>
      _ToClothListScreenRouteButtonState();
}

class _ToClothListScreenRouteButtonState extends State<ToClothListScreenRouteButton> {
  final Color _notPressedBackgroundColor = Colors.white;
  final Color _pressedBackgroundColor = Colors.grey[300]!;
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = _notPressedBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          backgroundColor = _pressedBackgroundColor;
        });
      },
      onTapUp: (_) {
        setState(() {
          backgroundColor = _notPressedBackgroundColor;
        });
      },
      onTapCancel: () {
        setState(() {
          backgroundColor = _notPressedBackgroundColor;
        });
      },
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onLongPressEnd: (_) {
        setState(() {
          backgroundColor = _notPressedBackgroundColor;
        });
      },
      onLongPressCancel: () {
        setState(() {
          backgroundColor = _notPressedBackgroundColor;
        });
      },
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
