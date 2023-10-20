import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class AddClothAppBar extends StatelessWidget {
  const AddClothAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          gradient: CustomLinearGradient.mainGradient),
      child: const Text(
        '부위별 신체사이즈',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
