import 'package:flutter/material.dart';
import '../../util/colors.dart';

class SwapSnackBar {
  static void showSnackBar(BuildContext context, bool enableReorder){
    const String swapText = "요소를 꾹 누르면 순서를 바꿀 수 있습니다.\n\n"
        "순서 바꾸기 모드를 해제하려면 우측 상단의 x를 눌러주세요.";
    const String cancelText = "순서 바꾸기 모드가 해제되었습니다.";

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: CustomColor.mainBlue,
        content: GestureDetector(
          onTap: () { ScaffoldMessenger.of(context).clearSnackBars(); },
          child: Text(
            enableReorder ? swapText : cancelText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}