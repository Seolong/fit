import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';

class AddCategoryDialog extends StatelessWidget {
  final ClothType clothType;
  final FirstCategoryViewModel viewModel;
  final TextEditingController _textEditingController = TextEditingController();

  AddCategoryDialog(
      {Key? key, required this.clothType, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: _textEditingController,
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
                  suffixIcon: _textEditingController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                          onPressed: () => _textEditingController.text = '',
                        )
                      : null // Show the clear button if the text field has something
                  )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                    //https://stackoverflow.com/questions/69466478/waiting-asynchronously-for-navigator-push-linter-warning-appears-use-build/69512692#69512692
                    final navigator = Navigator.of(context);
                    await viewModel.addClothCategory(
                        clothType, _textEditingController.text);
                    navigator.pop();
                  },
                  child: Text('저장')),
            ],
          ),
        ],
      ),
    );
  }
}
