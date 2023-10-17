import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/util/colors.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';

class AddClothScreen extends StatelessWidget {
  const AddClothScreen({
    Key? key,
    required this.categoryId,
    required this.clothType,
    required this.categoryTitle,
  }) : super(key: key);

  final int categoryId;
  final ClothType clothType;
  final String categoryTitle;

  Widget _createAppBar() {
    return Container(
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
    );
  }

  // 맨투맨, 데님바지, 니트...
  Widget _createSecondCategoryNameContainer({required String categoryName}) {
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
          categoryName,
          style: const TextStyle(
            fontSize: 20,
            color: CustomColor.mainBlue,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              _createAppBar(),
              _createSecondCategoryNameContainer(categoryName: categoryTitle),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SizeColumn(clothType).build(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '저장',
                      style: TextStyle(
                        color: CustomColor.mainBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
