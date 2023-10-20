import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({Key? key, required this.center, required this.end}) : super(key: key);
  final Widget center;
  final Widget end;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          gradient: CustomLinearGradient.mainGradient),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                center,
                end,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
