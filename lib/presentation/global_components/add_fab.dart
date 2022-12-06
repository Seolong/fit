import 'package:fit/util/size_value.dart';
import 'package:flutter/material.dart';

class AddFAB extends StatelessWidget {
  const AddFAB({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ButtonSize.medium,
      height: ButtonSize.medium,
      child: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
