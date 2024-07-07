import 'package:flutter/material.dart';

class CheckBoxProvider with ChangeNotifier {
  bool hasValue = false;
  void toggleHasValue() {
    hasValue = !hasValue;
    notifyListeners();
  }
}
