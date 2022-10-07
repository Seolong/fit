import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';

class AddCategoryDialog extends StatefulWidget {
  final ClothType clothType;
  final FirstCategoryViewModel viewModel;

  AddCategoryDialog(
      {Key? key, required this.clothType, required this.viewModel})
      : super(key: key);

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('새 카테고리'),
      contentPadding: const EdgeInsets.fromLTRB(20, 35, 20, 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textEditingController,
            onChanged: (value) {
              setState(() {});
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
                errorText: _errorMessage,
                suffixIcon: _textEditingController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _textEditingController.text = '';
                          setState(() {});
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
              Navigator.of(context).pop();
              //context.pop();
            },
            child: Text(
              '취소',
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () async {
              if(_textEditingController.text.isEmpty){
                setState(() {
                  _errorMessage = '이름을 입력하세요.';
                });
                return;
              }
              //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
              final navigator = Navigator.of(context);
              bool isAdded = await widget.viewModel.addClothCategory(
                  widget.clothType, _textEditingController.text);
              if(!isAdded){
                setState(() {
                  _errorMessage = '이미 같은 이름을 가진 그룹이 있습니다.';
                });
                return;
              }
              navigator.pop();
            },
            child: Text('저장')),
      ],
    );
  }
}
