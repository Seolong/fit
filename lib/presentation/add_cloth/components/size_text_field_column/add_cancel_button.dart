import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddCancelButton extends StatelessWidget {
  const AddCancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pop();
      },
      child: const Text(
        '취소',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
