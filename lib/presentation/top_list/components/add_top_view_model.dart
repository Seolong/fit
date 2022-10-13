import 'package:flutter/cupertino.dart';

class AddTopViewModel with ChangeNotifier {
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

  TextEditingController get nameTextEditingController => _nameTextEditingController;
  TextEditingController get totalLengthTextEditingController => _totalLengthTextEditingController;
  TextEditingController get shoulderWidthTextEditingController => _shoulderWidthTextEditingController;
  TextEditingController get chestWidthTextEditingController => _chestWidthTextEditingController;
  TextEditingController get sleeveLengthTextEditingController => _sleeveLengthTextEditingController;

  String? get nameErrorMessage => _nameErrorMessage;
  String? get totalErrorMessage => _totalErrorMessage;
  String? get shoulderErrorMessage => _shoulderErrorMessage;
  String? get chestErrorMessage => _chestErrorMessage;
  String? get sleeveErrorMessage => _sleeveErrorMessage;

  void setErrorMessageToNull() {
    _nameErrorMessage = null;
    _totalErrorMessage = null;
    _shoulderErrorMessage = null;
    _chestErrorMessage = null;
    _sleeveErrorMessage = null;

    notifyListeners();
  }
}