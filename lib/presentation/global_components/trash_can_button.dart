import 'package:flutter/material.dart';

class TrashCanButton extends StatelessWidget {
  const TrashCanButton({Key? key, required this.onTap}) : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const SizedBox(
        width: 60,
        height: 60,
        child: Icon(
          Icons.delete,
          size: 36,
          color: Colors.grey,
        ),
      ),
    );
  }
}
