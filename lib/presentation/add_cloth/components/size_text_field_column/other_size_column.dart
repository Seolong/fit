import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_text_field.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/view_model/other_size_column_view_model.dart';
import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OtherSizeColumn implements SizeColumn {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController detailTextController = TextEditingController();

  @override
  Widget buildListView(BuildContext context) {
    return ListView(
      physics: const RangeMaintainingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        SizeTextField(
          title: '이름',
          textEditingController: nameTextController,
        ),
        SizeTextField(
          title: '세부사항',
          textEditingController: detailTextController,
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
            TextButton(
              onPressed: () {
                context.pop();
              },
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
              onPressed: () {
                viewModel.addOther(
                  categoryId: categoryId,
                  name: nameTextController.text,
                  details: detailTextController.text,
                );
                context.pop();
              },
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
        );
      },
    );
  }
}
