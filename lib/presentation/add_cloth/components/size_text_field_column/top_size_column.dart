import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_column.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/size_text_field.dart';
import 'package:fit/presentation/add_cloth/components/size_text_field_column/view_model/top_size_column_view_model.dart';
import 'package:fit/util/string_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../di/di_setup.dart';
import 'add_cancel_button.dart';
import 'cloth_save_button.dart';

class TopSizeColumn implements SizeColumn {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _totalLengthTextController =
      TextEditingController();
  final TextEditingController _shoulderLengthTextController =
      TextEditingController();
  final TextEditingController _chestLengthTextController =
      TextEditingController();
  final TextEditingController _sleeveLengthTextController =
      TextEditingController();

  final TextEditingController _editNameTextController = TextEditingController();
  final TextEditingController _editTotalLengthTextController =
      TextEditingController();
  final TextEditingController _editShoulderLengthTextController =
      TextEditingController();
  final TextEditingController _editChestLengthTextController =
      TextEditingController();
  final TextEditingController _editSleeveLengthTextController =
      TextEditingController();

  TopSizeColumn(this.id);

  final int? id;

  @override
  Widget buildListView(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => getIt<TopSizeColumnViewModel>(),
        builder: (context, __) {
          final viewModel = context.read<TopSizeColumnViewModel>();
          //print('TopSizeColumn: $id');
          return FutureBuilder<Top?>(
              future: viewModel.getTop(id),
              builder: (context, snapshot) {
                //print('TopSizeColumn: ${snapshot.data}');
                if (!snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
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
                          title: '어깨너비',
                          textEditingController: _shoulderLengthTextController,
                          inputType: TextInputType.number,
                        ),
                        SizeTextField(
                          title: '가슴단면',
                          textEditingController: _chestLengthTextController,
                          inputType: TextInputType.number,
                        ),
                        SizeTextField(
                          title: '소매길이',
                          textEditingController: _sleeveLengthTextController,
                          inputType: TextInputType.number,
                          isLast: true,
                        ),
                      ],
                    ),
                  );
                }
                return ListView(
                  physics: const RangeMaintainingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    SizeTextField(
                      title: '이름',
                      textEditingController: _editNameTextController,
                      initialValue: snapshot.data?.name,
                    ),
                    SizeTextField(
                        title: '총장',
                        textEditingController: _editTotalLengthTextController,
                        inputType: TextInputType.number,
                        initialValue:
                            snapshot.data?.totalLength.toNoDotZeroNumString()),
                    SizeTextField(
                        title: '어깨너비',
                        textEditingController:
                            _editShoulderLengthTextController,
                        inputType: TextInputType.number,
                        initialValue: snapshot.data?.shoulderWidth
                            .toNoDotZeroNumString()),
                    SizeTextField(
                        title: '가슴단면',
                        textEditingController: _editChestLengthTextController,
                        inputType: TextInputType.number,
                        initialValue:
                            snapshot.data?.chestWidth.toNoDotZeroNumString()),
                    SizeTextField(
                      title: '소매길이',
                      textEditingController: _editSleeveLengthTextController,
                      inputType: TextInputType.number,
                      initialValue:
                          snapshot.data?.sleeveLength.toNoDotZeroNumString(),
                      isLast: true,
                    ),
                  ],
                );
              });
        });
  }

  @override
  Widget buildButtonRow(BuildContext context, int categoryId) {
    return ChangeNotifierProvider(
      create: (_) => getIt<TopSizeColumnViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<TopSizeColumnViewModel>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AddCancelButton(),
            ClothSaveButton(onPressed: () async {
              if (id == null) {
                await viewModel.addTop(
                  categoryId: categoryId,
                  name: _nameTextController.text,
                  totalLength: _totalLengthTextController.text,
                  chestWidth: _chestLengthTextController.text,
                  sleeveLength: _sleeveLengthTextController.text,
                  shoulderWidth: _shoulderLengthTextController.text,
                );
              } else {
                await viewModel.updateTop(
                  id: id!,
                  categoryId: categoryId,
                  name: _editNameTextController.text,
                  totalLength: _editTotalLengthTextController.text,
                  shoulderWidth: _editShoulderLengthTextController.text,
                  chestWidth: _editChestLengthTextController.text,
                  sleeveLength: _editSleeveLengthTextController.text,
                );
              }
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
