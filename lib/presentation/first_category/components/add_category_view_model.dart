import 'package:flutter/cupertino.dart';

class AddCategoryViewModel {
  final _textEditingController = TextEditingController();
  String? _errorMessage;
  bool isTextNotEmpty = true;

  TextEditingController get textEditingController => _textEditingController;

  String? get errorMessage => _errorMessage;

  void init() {
    isTextNotEmpty = _textEditingController.text.isNotEmpty;
  }

  void setErrorMessageToNull() {
    _errorMessage = null;
  }

  void setInputNoCharError() {
    _errorMessage = '이름을 입력하세요.';
  }

  void setSameNameError() {
    _errorMessage = '이미 같은 이름을 가진 카테고리가 있습니다.';
  }
}
