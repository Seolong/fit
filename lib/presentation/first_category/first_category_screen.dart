import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstCategoryScreen extends StatelessWidget {
  const FirstCategoryScreen({Key? key, required this.clothType})
      : super(key: key);

  final ClothType clothType;

  String toUpperCaseOnlyFirstLetter(String string) {
    String firstLetter = string[0];
    firstLetter = firstLetter.toUpperCase();

    return string.replaceFirst(string[0], firstLetter);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 72,
          height: 72,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            toUpperCaseOnlyFirstLetter(clothType.name),
          ),
        ),
        body: ListView(),
      ),
    );
  }
}
