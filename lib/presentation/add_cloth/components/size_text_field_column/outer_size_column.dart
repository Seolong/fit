import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_text_field.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/view_model/outer_size_column_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../di/di_setup.dart';
import 'add_cancel_button.dart';
import 'cloth_save_button.dart';

class OuterSizeColumn implements SizeColumn {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _totalLengthTextController =
      TextEditingController();
  final TextEditingController _shoulderLengthTextController =
      TextEditingController();
  final TextEditingController _chestLengthTextController =
      TextEditingController();
  final TextEditingController _sleeveLengthTextController =
      TextEditingController();

  @override
  Widget buildListView(BuildContext context) {
    return ListView(
      physics: const RangeMaintainingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        SizeTextField(
          title: '이름',
          textEditingController: _nameTextController,
        ),
        SizeTextField(
          title: '총장',
          textEditingController: _totalLengthTextController,
        ),
        SizeTextField(
          title: '어깨너비',
          textEditingController: _shoulderLengthTextController,
        ),
        SizeTextField(
          title: '가슴단면',
          textEditingController: _chestLengthTextController,
        ),
        SizeTextField(
          title: '소매길이',
          textEditingController: _sleeveLengthTextController,
          isLast: true,
        ),
      ],
    );
  }

  @override
  Widget buildButtonRow(BuildContext context, int categoryId) {
    return ChangeNotifierProvider(
      create: (_) => getIt<OuterSizeColumnViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<OuterSizeColumnViewModel>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AddCancelButton(),
            ClothSaveButton(onPressed: () async {
              await viewModel.addOuter(
                categoryId: categoryId,
                name: _nameTextController.text,
                totalLength: double.parse(_totalLengthTextController.text),
                chestWidth: double.parse(_chestLengthTextController.text),
                sleeveLength: double.parse(_sleeveLengthTextController.text),
                shoulderWidth: double.parse(_shoulderLengthTextController.text),
              );
              if (context.mounted) {
                context.pop();
              }
            }),
          ],
        );
      },
    );
  }
}
