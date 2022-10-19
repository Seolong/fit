import 'package:flutter/material.dart';

import '../../util/size_value.dart';

class SwapButton extends StatelessWidget {
  const SwapButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.swap_vert,
            size: ButtonSize.small,
            color: Colors.black,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
