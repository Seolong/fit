import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class SecondCategoryNameContainer extends StatelessWidget {
  const SecondCategoryNameContainer({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 125, 30, 0),
      child: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350]!,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, 3), // shadow direction: bottom right
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            color: CustomColor.mainBlue,
          ),
        ),
      ),
    );
  }
}
