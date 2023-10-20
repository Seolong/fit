import 'package:fit/presentation/add_cloth/components/add_cloth_app_bar.dart';
import 'package:fit/presentation/add_cloth/components/second_category_name_container.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
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

  @override
  Widget build(BuildContext context) {
    SizeColumn sizeColumn = SizeColumn(clothType);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              const AddClothAppBar(),
              // 맨투맨, 데님바지, 니트...
              SecondCategoryNameContainer(name: categoryTitle),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: sizeColumn.buildListView(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: SizedBox(
              height: 100,
              child: sizeColumn.buildButtonRow(context, categoryId),
            ),
          ),
        ],
      ),
    );
  }
}
