import 'package:flutter/material.dart';

class CustomColor {
  static const Color lightBlue = Colors.cyanAccent;
  static const Color deepBlue = Colors.indigoAccent;
  static const Color lightGrey = Color(0xffeeeeee);

  static const Color mainGreen = Color.fromARGB(255, 45, 215, 193);
  static const Color mainBlue = Color.fromARGB(255, 102, 197, 229);
  static const Color skyBlue = Color.fromARGB(255, 147, 217, 235);
}

class CustomLinearGradient {
  static const LinearGradient mainGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [CustomColor.mainGreen, CustomColor.mainBlue]);
}
