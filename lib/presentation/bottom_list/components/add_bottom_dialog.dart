import 'package:fit/presentation/bottom_list/bottom_list_view_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/cloth/bottom.dart';
import 'add_bottom_view_model.dart';

class AddBottomDialog extends StatefulWidget {
  const AddBottomDialog({
    Key? key,
    this.bottom,
    this.isEditMode = false,
    required this.bottomListViewModel,
    required this.categoryId,
  }) : super(key: key);

  final Bottom? bottom;
  final bool isEditMode;
  final BottomListViewModel bottomListViewModel;
  final int categoryId;

  @override
  State<AddBottomDialog> createState() => _AddBottomDialogState();
}

class _AddBottomDialogState extends State<AddBottomDialog> {
  final AddBottomViewModel addBottomViewModel = AddBottomViewModel();

  // required int id,
  // required int categoryId,
  // required String name,
  // required double totalLength,
  // required double waist,
  // required double thigh,
  // required double legOpening,
  // required double rise,
  // required int order,
  @override
  void initState() {
    super.initState();
    addBottomViewModel.init(
      name: widget.bottom?.name,
      total: widget.bottom?.totalLength,
      waist: widget.bottom?.waist,
      thigh: widget.bottom?.thigh,
      legOpening: widget.bottom?.legOpening,
      rise: widget.bottom?.rise,
    );
  }

  @override
  void dispose() {
    addBottomViewModel.dispose();
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
              controller: addBottomViewModel.nameTextEditingController,
              onChanged: (value) {
                if (addBottomViewModel.nameErrorMessage != null) {
                  setState(() {
                    addBottomViewModel.setErrorMessageToNull();
                  });
                }
                setState(() {
                  addBottomViewModel.isNameNotEmpty = value.isNotEmpty;
                });
              },
              decoration: _getInputDecoration(
                labelText: '이름',
                errorText: addBottomViewModel.nameErrorMessage,
                suffixIcon: addBottomViewModel.isNameNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            addBottomViewModel.nameTextEditingController.text =
                                '';
                            addBottomViewModel.isNameNotEmpty = false;
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
                        addBottomViewModel.totalLengthTextEditingController,
                    onChanged: (value) {
                      if (addBottomViewModel.totalErrorMessage != null) {
                        setState(() {
                          addBottomViewModel.setErrorMessageToNull();
                        });
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '총장',
                      errorText: addBottomViewModel.totalErrorMessage,
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
                    controller: addBottomViewModel.waistTextEditingController,
                    onChanged: (value) {
                      if (addBottomViewModel.waistErrorMessage != null) {
                        addBottomViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '허리단면',
                      errorText: addBottomViewModel.waistErrorMessage,
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
                    controller: addBottomViewModel.thighTextEditingController,
                    onChanged: (value) {
                      if (addBottomViewModel.thighErrorMessage != null) {
                        addBottomViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '허벅지단면',
                      errorText: addBottomViewModel.thighErrorMessage,
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
                    controller: addBottomViewModel.riseTextEditingController,
                    onChanged: (value) {
                      if (addBottomViewModel.riseErrorMessage != null) {
                        addBottomViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '밑위',
                      errorText: addBottomViewModel.riseErrorMessage,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: _getFieldTextStyle(),
                    textAlign: TextAlign.center,
                    controller:
                    addBottomViewModel.legOpeningTextEditingController,
                    onChanged: (value) {
                      if (addBottomViewModel.legOpeningErrorMessage != null) {
                        addBottomViewModel.setErrorMessageToNull();
                      }
                    },
                    decoration: _getInputDecoration(
                      labelText: '밑단',
                      errorText: addBottomViewModel.legOpeningErrorMessage,
                    ),
                  ),
                ),
                const SizedBox(width: 17.5,),
                const Spacer(),
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
            if (addBottomViewModel.isAnyFieldEmpty()) {
              setState(() {
                addBottomViewModel.setErrorMessageNoText();
              });
              return;
            }

            //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
            final navigator = Navigator.of(context);

            if (!widget.isEditMode) {
              widget.bottomListViewModel.addBottom(
                categoryId: widget.categoryId,
                name: addBottomViewModel.nameTextEditingController.text,
                totalLength: double.parse(
                    addBottomViewModel.totalLengthTextEditingController.text),
                waist: double.parse(
                    addBottomViewModel.waistTextEditingController.text),
                thigh: double.parse(
                    addBottomViewModel.thighTextEditingController.text),
                rise: double.parse(
                    addBottomViewModel.riseTextEditingController.text),
                legOpening: double.parse(
                    addBottomViewModel.legOpeningTextEditingController.text),
              );
              navigator.pop();
            } else {
              widget.bottomListViewModel.updateBottom(widget.bottom!.copyWith(
                name: addBottomViewModel.nameTextEditingController.text,
                totalLength: double.parse(
                    addBottomViewModel.totalLengthTextEditingController.text),
                waist: double.parse(
                    addBottomViewModel.waistTextEditingController.text),
                thigh: double.parse(
                    addBottomViewModel.thighTextEditingController.text),
                rise: double.parse(
                    addBottomViewModel.riseTextEditingController.text),
                legOpening: double.parse(
                    addBottomViewModel.legOpeningTextEditingController.text),
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
