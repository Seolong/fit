import 'package:fit/presentation/top_list/components/add_top_view_model.dart';
import 'package:fit/presentation/top_list/top_list_view_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/cloth/top.dart';

class AddTopDialog extends StatefulWidget {
  const AddTopDialog({
    Key? key,
    this.top,
    this.isEditMode = false,
    required this.topListViewModel,
    required this.categoryId,
  }) : super(key: key);

  final Top? top;
  final bool isEditMode;
  final TopListViewModel topListViewModel;
  final int categoryId;

  @override
  State<AddTopDialog> createState() => _AddTopDialogState();
}

class _AddTopDialogState extends State<AddTopDialog> {
  final AddTopViewModel addTopViewModel = AddTopViewModel();

  @override
  void initState() {
    super.initState();
    addTopViewModel.init(
      name: widget.top?.name,
      total: widget.top?.totalLength,
      shoulder: widget.top?.shoulderWidth,
      chest: widget.top?.chestWidth,
      sleeve: widget.top?.sleeveLength,
    );
  }

  @override
  void dispose() {
    addTopViewModel.dispose();
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
              controller: addTopViewModel.nameTextEditingController,
              onChanged: (value) {
                if (addTopViewModel.nameErrorMessage != null) {
                  setState(() {
                    addTopViewModel.setErrorMessageToNull();
                  });
                }
                setState(() {
                  addTopViewModel.isNameNotEmpty = value.isNotEmpty;
                });
              },
              decoration: _getInputDecoration(
                labelText: '이름',
                errorText: addTopViewModel.nameErrorMessage,
                suffixIcon: addTopViewModel.isNameNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            addTopViewModel.nameTextEditingController.text = '';
                            addTopViewModel.isNameNotEmpty = false;
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
                        addTopViewModel.totalLengthTextEditingController,
                    onChanged: (value) {
                      if (addTopViewModel.totalErrorMessage != null) {
                        setState(() {
                          addTopViewModel.setErrorMessageToNull();
                        });
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '총장',
                      errorText: addTopViewModel.totalErrorMessage,
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
                        addTopViewModel.shoulderWidthTextEditingController,
                    onChanged: (value) {
                      if (addTopViewModel.shoulderErrorMessage != null) {
                        addTopViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '어깨너비',
                      errorText: addTopViewModel.shoulderErrorMessage,
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
                    controller: addTopViewModel.chestWidthTextEditingController,
                    onChanged: (value) {
                      if (addTopViewModel.chestErrorMessage != null) {
                        addTopViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '가슴단면',
                      errorText: addTopViewModel.chestErrorMessage,
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
                        addTopViewModel.sleeveLengthTextEditingController,
                    onChanged: (value) {
                      if (addTopViewModel.sleeveErrorMessage != null) {
                        addTopViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '소매길이',
                      errorText: addTopViewModel.sleeveErrorMessage,
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
              if (widget.isEditMode) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
          onPressed: () async {
            if (addTopViewModel.isAnyFieldEmpty()) {
              setState(() {
                addTopViewModel.setErrorMessageNoText();
              });
              return;
            }

            //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
            final navigator = Navigator.of(context);

            if (!widget.isEditMode) {
              widget.topListViewModel.addTop(
                categoryId: widget.categoryId,
                name: addTopViewModel.nameTextEditingController.text,
                totalLength: double.parse(
                    addTopViewModel.totalLengthTextEditingController.text),
                shoulderWidth: double.parse(
                    addTopViewModel.shoulderWidthTextEditingController.text),
                chestWidth: double.parse(
                    addTopViewModel.chestWidthTextEditingController.text),
                sleeveLength: double.parse(
                    addTopViewModel.sleeveLengthTextEditingController.text),
              );
              navigator.pop();
            } else {
              widget.topListViewModel.updateTop(widget.top!.copyWith(
                name: addTopViewModel.nameTextEditingController.text,
                totalLength: double.parse(
                    addTopViewModel.totalLengthTextEditingController.text),
                shoulderWidth: double.parse(
                    addTopViewModel.shoulderWidthTextEditingController.text),
                chestWidth: double.parse(
                    addTopViewModel.chestWidthTextEditingController.text),
                sleeveLength: double.parse(
                    addTopViewModel.sleeveLengthTextEditingController.text),
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
