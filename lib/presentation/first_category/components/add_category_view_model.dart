import 'package:flutter/cupertino.dart';

class AddCategoryViewModel with ChangeNotifier {
  final _textEditingController = TextEditingController();
  String? _errorMessage;

  TextEditingController get textEditingController => _textEditingController;

  set textEditingControllerText(String text){
    _textEditingController.text = text;
    notifyListeners();
  }

  String? get errorMessage => _errorMessage;

  void setErrorMessageToNull() {
    _errorMessage = null;
    notifyListeners();
  }

  void setInputNoCharError() {
    _errorMessage = '이름을 입력하세요.';
    notifyListeners();
  }

  void setSameNameError() {
    _errorMessage = '이미 같은 이름을 가진 그룹이 있습니다.';
    notifyListeners();
  }
}