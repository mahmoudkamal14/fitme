import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void navigateTo(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateAndReplace(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }

  void navigateAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void pop() => Navigator.pop(this);
}
