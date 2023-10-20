import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class ClothSaveButton extends StatelessWidget {
  const ClothSaveButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        '저장',
        style: TextStyle(
          color: CustomColor.mainBlue,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
