import 'package:fit/util/string_helper.dart';
import 'package:flutter/material.dart';

import '../../../util/colors.dart';

class ItemColumn extends StatelessWidget {
  const ItemColumn({Key? key, required this.name, required this.size})
      : super(key: key);
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 24,
          height: 2,
          decoration: BoxDecoration(
            color: CustomColor.mainGreen,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(
          size.toNoDotZeroNumString().toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
