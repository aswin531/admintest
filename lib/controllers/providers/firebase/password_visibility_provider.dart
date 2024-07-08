import 'package:flutter/foundation.dart';

class PasswordVisibilityProvider with ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void toggleVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
