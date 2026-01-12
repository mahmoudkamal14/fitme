import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.isObscureText,
    this.enabled,
    this.readOnly,
    this.maxLines,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.backGroundColorHint,
    this.textInputType,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final String? hintText;
  final bool? isObscureText;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final Color? backGroundColorHint;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).inputDecorationTheme.helperStyle,
      controller: controller,
      keyboardType: textInputType,
      enabled: enabled ?? true,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: (value) {
        return validator!(value);
      },
    );
  }
}
