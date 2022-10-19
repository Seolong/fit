import 'package:flutter/material.dart';

import '../../../domain/model/cloth/outer.dart';
import '../outer_list_view_model.dart';
import 'add_outer_view_model.dart';

class AddOuterDialog extends StatefulWidget {
  const AddOuterDialog({
    Key? key,
    this.outer,
    this.isEditMode = false,
    required this.outerListViewModel,
    required this.categoryId,
  }) : super(key: key);

  final Outer? outer;
  final bool isEditMode;
  final OuterListViewModel outerListViewModel;
  final int categoryId;

  @override
  State<AddOuterDialog> createState() => _AddOuterDialogState();
}

class _AddOuterDialogState extends State<AddOuterDialog> {
  final AddOuterViewModel addOuterViewModel = AddOuterViewModel();

  @override
  void initState() {
    super.initState();
    addOuterViewModel.init(
      name: widget.outer?.name,
      total: widget.outer?.totalLength,
      shoulder: widget.outer?.shoulderWidth,
      chest: widget.outer?.chestWidth,
      sleeve: widget.outer?.sleeveLength,
    );
  }

  @override
  void dispose() {
    addOuterViewModel.dispose();
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
              controller: addOuterViewModel.nameTextEditingController,
              onChanged: (value) {
                if (addOuterViewModel.nameErrorMessage != null) {
                  setState(() {
                    addOuterViewModel.setErrorMessageToNull();
                  });
                }
                setState(() {
                  addOuterViewModel.isNameNotEmpty = value.isNotEmpty;
                });
              },
              decoration: _getInputDecoration(
                labelText: '이름',
                errorText: addOuterViewModel.nameErrorMessage,
                suffixIcon: addOuterViewModel.isNameNotEmpty
                    ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      addOuterViewModel.nameTextEditingController.text = '';
                      addOuterViewModel.isNameNotEmpty = false;
                    });
                  },
                )
                    : null,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    style: _getFieldTextStyle(),
                    textAlign: TextAlign.center,
                    controller:
                    addOuterViewModel.totalLengthTextEditingController,
                    onChanged: (value) {
                      if (addOuterViewModel.totalErrorMessage != null) {
                        setState(() {
                          addOuterViewModel.setErrorMessageToNull();
                        });
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '총장',
                      errorText: addOuterViewModel.totalErrorMessage,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 17.5,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    style: _getFieldTextStyle(),
                    textAlign: TextAlign.center,
                    controller:
                    addOuterViewModel.shoulderWidthTextEditingController,
                    onChanged: (value) {
                      if (addOuterViewModel.shoulderErrorMessage != null) {
                        addOuterViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '어깨너비',
                      errorText: addOuterViewModel.shoulderErrorMessage,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    style: _getFieldTextStyle(),
                    textAlign: TextAlign.center,
                    controller: addOuterViewModel.chestWidthTextEditingController,
                    onChanged: (value) {
                      if (addOuterViewModel.chestErrorMessage != null) {
                        addOuterViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '가슴단면',
                      errorText: addOuterViewModel.chestErrorMessage,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 17.5,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: _getFieldTextStyle(),
                    textAlign: TextAlign.center,
                    controller:
                    addOuterViewModel.sleeveLengthTextEditingController,
                    onChanged: (value) {
                      if (addOuterViewModel.sleeveErrorMessage != null) {
                        addOuterViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '소매길이',
                      errorText: addOuterViewModel.sleeveErrorMessage,
                    ),
                  ),
                ),
              ],
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
            if (addOuterViewModel.isAnyFieldEmpty()) {
              setState(() {
                addOuterViewModel.setErrorMessageNoText();
              });
              return;
            }

            //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
            final navigator = Navigator.of(context);

            if (!widget.isEditMode) {
              widget.outerListViewModel.addOuter(
                categoryId: widget.categoryId,
                name: addOuterViewModel.nameTextEditingController.text,
                totalLength: double.parse(
                    addOuterViewModel.totalLengthTextEditingController.text),
                shoulderWidth: double.parse(
                    addOuterViewModel.shoulderWidthTextEditingController.text),
                chestWidth: double.parse(
                    addOuterViewModel.chestWidthTextEditingController.text),
                sleeveLength: double.parse(
                    addOuterViewModel.sleeveLengthTextEditingController.text),
              );
              navigator.pop();
            } else {
              widget.outerListViewModel.updateOuter(widget.outer!.copyWith(
                name: addOuterViewModel.nameTextEditingController.text,
                totalLength: double.parse(
                    addOuterViewModel.totalLengthTextEditingController.text),
                shoulderWidth: double.parse(
                    addOuterViewModel.shoulderWidthTextEditingController.text),
                chestWidth: double.parse(
                    addOuterViewModel.chestWidthTextEditingController.text),
                sleeveLength: double.parse(
                    addOuterViewModel.sleeveLengthTextEditingController.text),
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
