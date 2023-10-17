import 'package:flutter/material.dart';

abstract class ColumnViewModel with ChangeNotifier {
  List<TextEditingController> textEditingControllers = List<TextEditingController>.empty(growable: true);
  Future<void> addCloth();
}