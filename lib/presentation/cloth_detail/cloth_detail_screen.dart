import 'package:fit/presentation/cloth_detail/components/detail_content/detail_content.dart';
import 'package:fit/presentation/global_components/gradient_app_bar.dart';
import 'package:fit/util/colors.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';

/// * [clothType], 보여질 옷의 타입
/// * [id], 보여질 옷의 id
class ClothDetailScreen extends StatelessWidget {
  const ClothDetailScreen({Key? key, required this.clothType, required this.id})
      : super(key: key);

  final ClothType clothType;
  final int id;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final DetailContent detailContent = DetailContent(clothType);
    return Scaffold(
      floatingActionButton: detailContent.buildFabColumn(context, id),
      body: Stack(
        children: [
          GradientAppBar(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 32),
            center: const Text(
              "사이즈 그래프",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            end: const SizedBox(width: 45),
            height: screenSize.height * 0.4,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 120),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    )
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  detailContent.buildNameText(context, id),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 24,
                    height: 2,
                    decoration: BoxDecoration(
                      color: CustomColor.mainGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  _getClothIcon(),
                  _getClassificationText(clothType),
                  detailContent.buildSizeContent(context, id),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getClothIcon() {
    return const Icon(
      Icons.ac_unit,
      size: 100,
    );
  }

  Widget _getClassificationText(ClothType type) {
    String typeString =
        type.name.replaceFirst(type.name[0], type.name[0].toUpperCase());
    String result = '';

    for (int i = 0; i < typeString.length; i++) {
      result += typeString[i];
      if (i != typeString.length - 1) {
        result += ' ';
      }
    }

    return Text(
      result,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
