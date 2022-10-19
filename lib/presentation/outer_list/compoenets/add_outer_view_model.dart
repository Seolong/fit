import 'package:fit/util/string_helper.dart';
import 'package:flutter/cupertino.dart';

class AddOuterViewModel {
  final _nameTextEditingController = TextEditingController();
  final _totalLengthTextEditingController = TextEditingController();
  final _shoulderWidthTextEditingController = TextEditingController();
  final _chestWidthTextEditingController = TextEditingController();
  final _sleeveLengthTextEditingController = TextEditingController();
  String? _nameErrorMessage;
  String? _totalErrorMessage;
  String? _shoulderErrorMessage;
  String? _chestErrorMessage;
  String? _sleeveErrorMessage;
  bool isNameNotEmpty = false;

  TextEditingController get nameTextEditingController =>
      _nameTextEditingController;

  TextEditingController get totalLengthTextEditingController =>
      _totalLengthTextEditingController;

  TextEditingController get shoulderWidthTextEditingController =>
      _shoulderWidthTextEditingController;

  TextEditingController get chestWidthTextEditingController =>
      _chestWidthTextEditingController;

  TextEditingController get sleeveLengthTextEditingController =>
      _sleeveLengthTextEditingController;

  String? get nameErrorMessage => _nameErrorMessage;

  String? get totalErrorMessage => _totalErrorMessage;

  String? get shoulderErrorMessage => _shoulderErrorMessage;

  String? get chestErrorMessage => _chestErrorMessage;

  String? get sleeveErrorMessage => _sleeveErrorMessage;

  void init({
    String? name,
    double? total,
    double? shoulder,
    double? chest,
    double? sleeve,
  }) {
    _nameTextEditingController.text = name ?? '';
    _totalLengthTextEditingController.text = total?.toNoDotZeroNumString() ?? '';
    _shoulderWidthTextEditingController.text = shoulder?.toNoDotZeroNumString() ?? '';
    _chestWidthTextEditingController.text = chest?.toNoDotZeroNumString() ?? '';
    _sleeveLengthTextEditingController.text = sleeve?.toNoDotZeroNumString() ?? '';

    isNameNotEmpty = nameTextEditingController.text.isNotEmpty;
  }

  void dispose() {
    _nameTextEditingController.dispose();
    _totalLengthTextEditingController.dispose();
    _shoulderWidthTextEditingController.dispose();
    _chestWidthTextEditingController.dispose();
    _sleeveLengthTextEditingController.dispose();
  }

  void setErrorMessageToNull() {
    _nameErrorMessage = null;
    _totalErrorMessage = null;
    _shoulderErrorMessage = null;
    _chestErrorMessage = null;
    _sleeveErrorMessage = null;
  }

  bool isAnyFieldEmpty() {
    return _nameTextEditingController.text.isEmpty ||
        _totalLengthTextEditingController.text.isEmpty ||
        _shoulderWidthTextEditingController.text.isEmpty ||
        _chestWidthTextEditingController.text.isEmpty ||
        _sleeveLengthTextEditingController.text.isEmpty;
  }

  void setErrorMessageNoText() {
    if (_nameTextEditingController.text.isEmpty) {
      _nameErrorMessage = '입력해주세요.';
    }
    if (_totalLengthTextEditingController.text.isEmpty) {
      _totalErrorMessage = '입력해주세요.';
    }
    if (_shoulderWidthTextEditingController.text.isEmpty) {
      _shoulderErrorMessage = '입력해주세요.';
    }
    if (_chestWidthTextEditingController.text.isEmpty) {
      _chestErrorMessage = '입력해주세요.';
    }
    if (_sleeveLengthTextEditingController.text.isEmpty) {
      _sleeveErrorMessage = '입력해주세요.';
    }
  }
}
