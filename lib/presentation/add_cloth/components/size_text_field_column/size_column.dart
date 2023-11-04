import 'package:fit/presentation/add_cloth/components/size_text_field_column/top_size_column.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/cupertino.dart';

import 'bottom_size_column.dart';
import 'other_size_column.dart';
import 'outer_size_column.dart';

abstract class SizeColumn {
  Widget buildListView(BuildContext context);
  Widget buildButtonRow(BuildContext context, int categoryId);

  factory SizeColumn(ClothType type, int? clothId) {
    switch (type){
      case ClothType.top:
        return TopSizeColumn(clothId);
      case ClothType.bottom:
        return BottomSizeColumn();
      case ClothType.outer:
        return OuterSizeColumn();
      case ClothType.other:
        return OtherSizeColumn();
      default:
        assert(false, 'Error in SizeColumnFactory');
        return OtherSizeColumn();
    }
  }
}