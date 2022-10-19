import 'package:flutter/cupertino.dart';

class AddOtherViewModel {
  final _nameTextEditingController = TextEditingController();
  final _detailsTextEditingController = TextEditingController();
  String? _nameErrorMessage;
  String? _detailsErrorMessage;
  bool isNameNotEmpty = false;
  bool isDetailsNotEmpty = false;

  TextEditingController get nameTextEditingController =>
      _nameTextEditingController;

  TextEditingController get detailsTextEditingController =>
      _detailsTextEditingController;

  String? get nameErrorMessage => _nameErrorMessage;

  String? get detailsErrorMessage => _detailsErrorMessage;

  void init({
    String? name,
    String? details,
  }) {
    _nameTextEditingController.text = name ?? '';
    _detailsTextEditingController.text = details ?? '';

    isNameNotEmpty = nameTextEditingController.text.isNotEmpty;
    isDetailsNotEmpty = detailsTextEditingController.text.isNotEmpty;
  }

  void dispose() {
    _nameTextEditingController.dispose();
    _detailsTextEditingController.dispose();
  }

  void setErrorMessageToNull() {
    _nameErrorMessage = null;
    _detailsErrorMessage = null;
  }

  bool isAnyFieldEmpty() {
    return _nameTextEditingController.text.isEmpty ||
        _detailsTextEditingController.text.isEmpty;
  }

  void setErrorMessageNoText() {
    if (_nameTextEditingController.text.isEmpty) {
      _nameErrorMessage = '입력해주세요.';
    }
    if (_detailsTextEditingController.text.isEmpty) {
      _detailsErrorMessage = '입력해주세요.';
    }
  }
}
