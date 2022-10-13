import 'package:fit/presentation/top_list/components/add_top_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cloth/top.dart';

class AddTopDialog extends StatelessWidget {
  const AddTopDialog({Key? key, this.top, this.isEditMode = false})
      : super(key: key);

  final Top? top;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTopViewModel>(
      create: (_) => AddTopViewModel(),
      builder: (__, ___) => Consumer<AddTopViewModel>(
        builder: (context, addTopViewModel, child) => AlertDialog(
          title: Text('새 옷 입력'),
          contentPadding: const EdgeInsets.fromLTRB(20, 35, 20, 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: addTopViewModel.nameTextEditingController
                  ..text = top?.name ?? '',
                onChanged: (value) {
                  if (addTopViewModel.nameErrorMessage != null) {
                    addTopViewModel.setErrorMessageToNull();
                  }
                },
                decoration: _getInputDecoration(
                    labelText: '이름',
                    errorText: addTopViewModel.nameErrorMessage,
                    suffixIcon: addTopViewModel
                            .nameTextEditingController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              addTopViewModel.nameTextEditingController.text =
                                  '';
                            },
                          )
                        : null),
              ),
            ],
          ),
          actions: [
            // TextButton(
            //     onPressed: () {
            //       if (isEditMode) {
            //         Navigator.of(context).pop();
            //         Navigator.of(context).pop();
            //       } else {
            //         Navigator.of(context).pop();
            //       }
            //       //context.pop();
            //     },
            //     child: Text(
            //       '취소',
            //       style: TextStyle(color: Colors.grey),
            //     )),
            // TextButton(
            //     onPressed: () async {
            //       if (addTopViewModel.nameTextEditingController.text.isEmpty) {
            //         addTopViewModel.setInputNoCharError();
            //         return;
            //       }
            //       bool haveItem = firstCategoryViewModel.haveThisCategory(
            //         pageClothType,
            //         addTopViewModel.textEditingController.text,
            //       );
            //       if (haveItem) {
            //         addTopViewModel.setSameNameError();
            //         return;
            //       }
            //
            //       //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
            //       final navigator = Navigator.of(context);
            //
            //       if (!isEditMode) {
            //         firstCategoryViewModel.addClothCategory(
            //           pageClothType,
            //           addTopViewModel.textEditingController.text,
            //         );
            //         navigator.pop();
            //       } else {
            //         firstCategoryViewModel.updateClothCategory(
            //           clothCategory!.copyWith(
            //             title: addTopViewModel.textEditingController.text,
            //           ),
            //         );
            //         navigator.pop();
            //         navigator.pop();
            //       }
            //     },
            //     child: Text('저장')),
          ],
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration({
    required String labelText,
    required String? errorText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 20),
        errorText: errorText,
        suffixIcon: suffixIcon);
  }
}
