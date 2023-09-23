import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class AddClothScreen extends StatelessWidget {
  const AddClothScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background widget (can be your AppBar content)
          Container(
            height: 150,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [CustomColor.mainGreen, CustomColor.mainBlue])),
            child: const Text(
              '부위별 신체사이즈',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          // Body content (positioned over the AppBar)
          Padding(
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
                    offset:
                        const Offset(0.0, 3), // shadow direction: bottom right
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '상의/하의/외투',
                style: TextStyle(
                  fontSize: 20,
                  color: CustomColor.mainBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
