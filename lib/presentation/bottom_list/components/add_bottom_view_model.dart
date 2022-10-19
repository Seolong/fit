import 'package:fit/util/string_helper.dart';
import 'package:flutter/cupertino.dart';

class AddBottomViewModel {
  // required int id,
  // required int categoryId,
  // required String name,
  // required double totalLength,
  // required double waist,
  // required double thigh,
  // required double legOpening,
  // required double rise,
  // required int order,

  final _nameTextEditingController = TextEditingController();
  final _totalLengthTextEditingController = TextEditingController();
  final _waistTextEditingController = TextEditingController();
  final _thighTextEditingController = TextEditingController();
  final _legOpeningTextEditingController = TextEditingController();
  final _riseTextEditingController = TextEditingController();

  String? _nameErrorMessage;
  String? _totalErrorMessage;
  String? _waistErrorMessage;
  String? _thighErrorMessage;
  String? _legOpeningErrorMessage;
  String? _riseErrorMessage;
  bool isNameNotEmpty = false;

  TextEditingController get nameTextEditingController =>
      _nameTextEditingController;

  TextEditingController get totalLengthTextEditingController =>
      _totalLengthTextEditingController;

  TextEditingController get waistTextEditingController =>
      _waistTextEditingController;

  TextEditingController get thighTextEditingController =>
      _thighTextEditingController;

  TextEditingController get legOpeningTextEditingController =>
      _legOpeningTextEditingController;

  TextEditingController get riseTextEditingController =>
      _riseTextEditingController;

  String? get nameErrorMessage => _nameErrorMessage;

  String? get totalErrorMessage => _totalErrorMessage;

  String? get waistErrorMessage => _waistErrorMessage;

  String? get thighErrorMessage => _thighErrorMessage;

  String? get legOpeningErrorMessage => _legOpeningErrorMessage;

  String? get riseErrorMessage => _riseErrorMessage;

  void init({
    String? name,
    double? total,
    double? waist,
    double? thigh,
    double? legOpening,
    double? rise,
  }) {
    _nameTextEditingController.text = name ?? '';
    _totalLengthTextEditingController.text =
        total?.toNoDotZeroNumString() ?? '';
    _waistTextEditingController.text = waist?.toNoDotZeroNumString() ?? '';
    _thighTextEditingController.text = thigh?.toNoDotZeroNumString() ?? '';
    _legOpeningTextEditingController.text =
        legOpening?.toNoDotZeroNumString() ?? '';
    _riseTextEditingController.text = rise?.toNoDotZeroNumString() ?? '';

    isNameNotEmpty = _nameTextEditingController.text.isNotEmpty;
  }

  void dispose() {
    _nameTextEditingController.dispose();
    _totalLengthTextEditingController.dispose();
    _waistTextEditingController.dispose();
    _thighTextEditingController.dispose();
    _legOpeningTextEditingController.dispose();
    _riseTextEditingController.dispose();
  }

  void setErrorMessageToNull() {
    _nameErrorMessage = null;
    _totalErrorMessage = null;
    _waistErrorMessage = null;
    _thighErrorMessage = null;
    _legOpeningErrorMessage = null;
    _riseErrorMessage = null;
  }

  bool isAnyFieldEmpty() {
    return _nameTextEditingController.text.isEmpty ||
        _totalLengthTextEditingController.text.isEmpty ||
        _waistTextEditingController.text.isEmpty ||
        _thighTextEditingController.text.isEmpty ||
        _legOpeningTextEditingController.text.isEmpty ||
        _riseTextEditingController.text.isEmpty;
  }

  void setErrorMessageNoText() {
    if (_nameTextEditingController.text.isEmpty) {
      _nameErrorMessage = '입력해주세요.';
    }
    if (_totalLengthTextEditingController.text.isEmpty) {
      _totalErrorMessage = '입력해주세요.';
    }
    if (_waistTextEditingController.text.isEmpty) {
      _waistErrorMessage = '입력해주세요.';
    }
    if (_thighTextEditingController.text.isEmpty) {
      _thighErrorMessage = '입력해주세요.';
    }
    if (_legOpeningTextEditingController.text.isEmpty) {
      _legOpeningErrorMessage = '입력해주세요.';
    }
    if (_riseTextEditingController.text.isEmpty){
      _riseErrorMessage = '입력해주세요.';
    }
  }
}
