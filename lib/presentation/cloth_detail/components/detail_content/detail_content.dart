import 'package:fit/presentation/cloth_detail/components/detail_content/top_detail_content.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';

abstract class DetailContent {
  Widget buildDetailContent(BuildContext context, int id);

  Widget buildFabColumn(BuildContext context, int id);

  factory DetailContent(ClothType type) {
    switch(type){
      case ClothType.top:
        return TopDetailContent();
      default:
        return TopDetailContent();
      // case ClothType.bottom:
      //   // TODO: Handle this case.
      //   break;
      // case ClothType.outer:
      //   // TODO: Handle this case.
      //   break;
      // case ClothType.other:
      //   // TODO: Handle this case.
      //   break;
    }
  }
}