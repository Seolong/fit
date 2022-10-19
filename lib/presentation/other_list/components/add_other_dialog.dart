import 'package:fit/presentation/other_list/components/add_other_view_model.dart';
import 'package:fit/presentation/other_list/other_list_view_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/cloth/other.dart';

class AddOtherDialog extends StatefulWidget {
  const AddOtherDialog({
    Key? key,
    this.other,
    this.isEditMode = false,
    required this.otherListViewModel,
    required this.categoryId,
  }) : super(key: key);

  final Other? other;
  final bool isEditMode;
  final OtherListViewModel otherListViewModel;
  final int categoryId;

  @override
  State<AddOtherDialog> createState() => _AddOtherDialogState();
}

class _AddOtherDialogState extends State<AddOtherDialog> {
  final AddOtherViewModel addOtherViewModel = AddOtherViewModel();

  @override
  void initState() {
    super.initState();
    addOtherViewModel.init(
      name: widget.other?.name,
      details: widget.other?.details,
    );
  }

  @override
  void dispose() {
    addOtherViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '새 옷 입력',
                style: TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              textInputAction: TextInputAction.next,
              style: _getFieldTextStyle(),
              controller: addOtherViewModel.nameTextEditingController,
              onChanged: (value) {
                if (addOtherViewModel.nameErrorMessage != null) {
                  setState(() {
                    addOtherViewModel.setErrorMessageToNull();
                  });
                }
                setState(() {
                  addOtherViewModel.isNameNotEmpty = value.isNotEmpty;
                });
              },
              decoration: _getInputDecoration(
                labelText: '이름',
                errorText: addOtherViewModel.nameErrorMessage,
                suffixIcon: addOtherViewModel.isNameNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            addOtherViewModel.nameTextEditingController.text =
                                '';
                            addOtherViewModel.isNameNotEmpty = false;
                          });
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              style: _getFieldTextStyle(),
              controller: addOtherViewModel.detailsTextEditingController,
              onChanged: (value) {
                if (addOtherViewModel.detailsErrorMessage != null) {
                  setState(() {
                    addOtherViewModel.setErrorMessageToNull();
                  });
                }
                setState(() {
                  addOtherViewModel.isDetailsNotEmpty = value.isNotEmpty;
                });
              },
              decoration: _getInputDecoration(
                labelText: '세부사항',
                errorText: addOtherViewModel.detailsErrorMessage,
                suffixIcon: addOtherViewModel.isDetailsNotEmpty
                    ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      addOtherViewModel.detailsTextEditingController.text =
                      '';
                      addOtherViewModel.isDetailsNotEmpty = false;
                    });
                  },
                )
                    : null,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
          onPressed: () async {
            if (addOtherViewModel.isAnyFieldEmpty()) {
              setState(() {
                addOtherViewModel.setErrorMessageNoText();
              });
              return;
            }

            //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
            final navigator = Navigator.of(context);

            if (!widget.isEditMode) {
              widget.otherListViewModel.addOther(
                categoryId: widget.categoryId,
                name: addOtherViewModel.nameTextEditingController.text,
                details: addOtherViewModel.detailsTextEditingController.text,
              );
              navigator.pop();
            } else {
              widget.otherListViewModel.updateOther(widget.other!.copyWith(
                name: addOtherViewModel.nameTextEditingController.text,
                details: addOtherViewModel.detailsTextEditingController.text,
              ));
              navigator.pop();
            }
          },
          child: const Text('저장'),
        ),
      ],
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

  TextStyle _getFieldTextStyle() {
    return const TextStyle(
      fontSize: 18,
    );
  }
}
