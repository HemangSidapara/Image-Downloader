extension StringToInt on String {
  int toInt() {
    return int.parse(this);
  }
}

extension StringToDouble on String {
  double toDouble() {
    return double.parse(this);
  }
}

extension StringToNum on String {
  num toNum() {
    return num.parse(this);
  }
}
