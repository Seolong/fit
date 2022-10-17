import 'package:flutter_test/flutter_test.dart';

void main(){
  test('grammer Test', () {
    double value = 8.0;
    int toCompareValue = value.ceil();
    bool isEqual = value == toCompareValue;

    expect(true, isEqual);
  });
}