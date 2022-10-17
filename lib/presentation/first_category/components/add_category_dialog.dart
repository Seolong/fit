import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/presentation/first_category/components/add_category_view_model.dart';
import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';

class AddCategoryDialog extends StatefulWidget {
  final ClothType pageClothType;
  final FirstCategoryViewModel firstCategoryViewModel;
  final bool isEditMode;
  final ClothCategory? clothCategory;

  const AddCategoryDialog({
    super.key,
    required this.pageClothType,
    required this.firstCategoryViewModel,
    this.isEditMode = false,
    this.clothCategory,
  });

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final AddCategoryViewModel addCategoryViewModel = AddCategoryViewModel();

  @override
  void initState() {
    super.initState();
    addCategoryViewModel.textEditingController.text =
        widget.clothCategory?.title ?? '';
    addCategoryViewModel.init();
  }

  @override
  void dispose() {
    addCategoryViewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(!widget.isEditMode ? '새 카테고리' : '카테고리 이름 수정'),
      contentPadding: const EdgeInsets.fromLTRB(20, 35, 20, 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: addCategoryViewModel.textEditingController,
            onChanged: (value) {
              if (addCategoryViewModel.errorMessage != null) {
                setState(() {
                  addCategoryViewModel.setErrorMessageToNull();
                });
              }
              setState(() {
                addCategoryViewModel.isTextNotEmpty = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                labelText: '이름',
                errorText: addCategoryViewModel.errorMessage,
                suffixIcon: addCategoryViewModel.isTextNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            addCategoryViewModel.textEditingController.text =
                                '';
                            addCategoryViewModel.isTextNotEmpty = false;
                          });
                        },
                      )
                    : null // Show the clear button if the text field has something
                ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (widget.isEditMode) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
              //context.pop();
            },
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () async {
              if (addCategoryViewModel.textEditingController.text.isEmpty) {
                setState(() {
                  addCategoryViewModel.setInputNoCharError();
                });
                return;
              }
              bool haveItem = widget.firstCategoryViewModel.haveThisCategory(
                widget.pageClothType,
                addCategoryViewModel.textEditingController.text,
              );
              if (haveItem) {
                setState(() {
                  addCategoryViewModel.setSameNameError();
                });
                return;
              }

              //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
              final navigator = Navigator.of(context);

              if (!widget.isEditMode) {
                widget.firstCategoryViewModel.addClothCategory(
                  widget.pageClothType,
                  addCategoryViewModel.textEditingController.text,
                );
                navigator.pop();
              } else {
                widget.firstCategoryViewModel.updateClothCategory(
                  widget.clothCategory!.copyWith(
                    title: addCategoryViewModel.textEditingController.text,
                  ),
                );
                navigator.pop();
                navigator.pop();
              }
            },
            child: const Text('저장')),
      ],
    );
  }
}
