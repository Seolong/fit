import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        reorder ? Icons.close : Icons.swap_vert,
        size: ButtonSize.small,
        color: reorder ? Colors.grey[700]: const Color(0xff5D4DEB),
      ),
    );
  }
}
