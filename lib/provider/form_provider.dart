import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String? _nameError;
  String? get nameError => _nameError;
  String? _emailError;
  String? get emailError => _emailError;
  String? _passwordError;
  String? get passwordError => _passwordError;

  void validateName(String value) {
    if (value.isEmpty) {
      _nameError = 'Name cannot be empty';
      notifyListeners();
    } else if (value.length < 3) {
      _nameError = 'Name must be at least 3 characters';
      notifyListeners();
    } else {
      _nameError = null;
      notifyListeners();
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      _emailError = 'Email cannot be empty';
      notifyListeners();
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      _emailError = 'Enter a valid email';
      notifyListeners();
    } else {
      _emailError = null;
      notifyListeners();
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      _passwordError = 'Password cannot be empty';
      notifyListeners();
    } else if (value.length < 3) {
      _passwordError = 'Password must be at least 3 characters';
      notifyListeners();
    } else {
      _passwordError = null;
      notifyListeners();
    }
  }
}
