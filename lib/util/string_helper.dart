extension StringHelper on double {
  String toNoDotZeroNumString() {
    bool isDotZeroNumber(double value) {
      int toCompareValue = value.ceil();
      if (value == toCompareValue) {
        return true;
      }
      return false;
    }

    if (isDotZeroNumber(this)) {
      return '${ceil()}';
    }
    return '$this';
  }
}