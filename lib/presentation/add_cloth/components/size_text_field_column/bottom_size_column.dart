import 'package:fit/presentation/add_cloth/components/size_text_field_column/add_cancel_button.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_text_field.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/view_model/bottom_size_column_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../di/di_setup.dart';
import 'cloth_save_button.dart';

class BottomSizeColumn implements SizeColumn {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _totalLengthTextController =
      TextEditingController();
  final TextEditingController _waistTextController = TextEditingController();
  final TextEditingController _thighTextController = TextEditingController();
  final TextEditingController _legOpeningTextController = TextEditingController();
  final TextEditingController _riseTextController = TextEditingController();

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
          inputType: TextInputType.number,
        ),
        SizeTextField(
          title: '허리단면',
          textEditingController: _waistTextController,
          inputType: TextInputType.number,
        ),
        SizeTextField(
          title: '허벅지단면',
          textEditingController: _thighTextController,
          inputType: TextInputType.number,
        ),
        SizeTextField(
          title: '밑위',
          textEditingController: _legOpeningTextController,
          inputType: TextInputType.number,
        ),
        SizeTextField(
          title: '밑단',
          textEditingController: _riseTextController,
          inputType: TextInputType.number,
          isLast: true,
        ),
      ],
    );
  }

  @override
  Widget buildButtonRow(BuildContext context, int categoryId) {
    return ChangeNotifierProvider(
      create: (_) => getIt<BottomSizeColumnViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<BottomSizeColumnViewModel>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AddCancelButton(),
            ClothSaveButton(onPressed: () async {
              await viewModel.addBottom(
                categoryId: categoryId,
                name: _nameTextController.text,
                totalLength: _totalLengthTextController.text,
                waist: _waistTextController.text,
                thigh: _thighTextController.text,
                legOpening: _legOpeningTextController.text,
                rise: _riseTextController.text
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
