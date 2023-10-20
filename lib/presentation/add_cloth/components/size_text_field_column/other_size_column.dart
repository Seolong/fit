import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/add_cancel_button.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/cloth_save_button.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_text_field.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/view_model/other_size_column_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OtherSizeColumn implements SizeColumn {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _detailTextController = TextEditingController();

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
          title: '세부사항',
          textEditingController: _detailTextController,
          isLast: true,
        ),
      ],
    );
  }

  @override
  Widget buildButtonRow(BuildContext context, int categoryId) {
    return ChangeNotifierProvider(
      create: (_) => getIt<OtherSizeColumnViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<OtherSizeColumnViewModel>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AddCancelButton(),
            ClothSaveButton(onPressed: (){
              viewModel.addOther(
                categoryId: categoryId,
                name: _nameTextController.text,
                details: _detailTextController.text,
              );
              context.pop();
            }),
          ],
        );
      },
    );
  }
}
