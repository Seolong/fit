import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          const Text(
            '부위별 신체사이즈',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(width: 50,),
        ],
      ),
    );
  }
}
