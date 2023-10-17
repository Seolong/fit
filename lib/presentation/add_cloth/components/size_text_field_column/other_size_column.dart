import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_text_field.dart';
import 'package:flutter/material.dart';

class OtherSizeColumn implements SizeColumn {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController totalLengthTextController = TextEditingController();

  @override
  Widget build() {
    return ListView(
      physics: const RangeMaintainingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        SizeTextField(title: '이름', textEditingController: nameTextController,),
        SizeTextField(title: '세부사항', textEditingController: totalLengthTextController, isLast: true,),
      ],
    );
  }
}
