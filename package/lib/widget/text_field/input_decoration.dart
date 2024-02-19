
import 'package:flutter/material.dart';
import 'package:package/package.dart';

InputDecoration inputDecoration({
  IconData? prefixIcon,
  double radius = 5,
  IconData? suffixIcon,
  Color? fillColor,
  Widget? prefix,
  Widget? suffix,
  String? label,
  String? hint,
  required BuildContext context
}) {
  bool filled = fillColor == null ? false : true;

  return InputDecoration(
    isDense: true,
    hintText: hint,
    labelText: label,
    alignLabelWithHint: true,
    contentPadding: 15.12.pxSy,
    labelStyle: StyleX.background(context),
    hintStyle: StyleX.grey,
    fillColor: fillColor,
    filled: filled,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    prefixIcon: prefix ?? (prefixIcon == null ? null : Icon(prefixIcon)),
    suffixIcon: suffix ?? (suffixIcon == null ? null : Icon(suffixIcon)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(radius)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(radius)),
    prefixIconConstraints: const BoxConstraints(
      maxWidth: 150,
      maxHeight: 50,
      minWidth: 38,
      minHeight: 38,
    ),
  );
}

InputDecoration inputDecorationWithoutBorder({
  IconData? prefixIcon,
  IconData? suffixIcon,
  Widget? prefix,
  Widget? suffix,
  String? label,
  String? hint,
  required BuildContext context,
}) {
  return InputDecoration(
    isDense: true,
    hintText: hint,
    labelText: label,
    alignLabelWithHint: true,
    contentPadding: 15.12.pxSy,
    labelStyle: StyleX.bodyLarge(context),
    hintStyle: StyleX.shadow(context),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    prefixIcon: prefix ?? (prefixIcon == null ? null : Icon(prefixIcon)),
    suffixIcon: suffix ?? (suffixIcon == null ? null : Icon(suffixIcon)),
    prefixIconConstraints: const BoxConstraints(
      maxWidth: 150,
      maxHeight: 50,
      minWidth: 38,
      minHeight: 38,
    ),
  );
}
