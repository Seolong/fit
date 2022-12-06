import 'package:flutter/material.dart';

import '../../util/size_value.dart';

class SwapButton extends StatelessWidget {
  const SwapButton({
    Key? key,
    required this.onTap,
    required this.reorder,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool reorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.swap_vert,
            size: ButtonSize.small,
            color: reorder ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          reorder ? 'On' : 'Off',
          style: TextStyle(
            color: reorder ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}
