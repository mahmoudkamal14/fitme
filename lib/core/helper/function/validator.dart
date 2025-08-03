import 'package:fitme/core/helper/utils/app_regex.dart';

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (AppRegex.hasLowerCase(value) == false) {
    return 'Must contain at least 1 lowercase letter';
  } else if (AppRegex.hasUpperCase(value) == false) {
    return 'Must contain at least 1 capital letter';
  } else if (AppRegex.hasNumber(value) == false) {
    return 'Must contain at least 1 number';
  } else if (AppRegex.hasSpecialCharacter(value) == false) {
    return r'Must contain at least 1 symbol ( $, #, @,..)';
  } else if (AppRegex.hasMinLength(value) == false) {
    return 'Must be at least 8 characters';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Name is required';
  }

  if (value.trim().length < 2) {
    return 'Name is too short';
  }

  final nameRegExp = RegExp(r"^[a-zA-Z\u0621-\u064A\s]+$");
  if (!nameRegExp.hasMatch(value.trim())) {
    return 'Name must contain only letters';
  }

  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  } else if (AppRegex.isEmailValid(value) == false) {
    return 'Invalid email format';
  }

  return null;
}
