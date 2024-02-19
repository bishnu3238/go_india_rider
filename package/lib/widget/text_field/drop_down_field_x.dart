import 'package:flutter/material.dart';
import 'package:package/package.dart';

/// -- this widget in incomplete;

class DropDownFieldX<T> extends StatelessWidget {
  const DropDownFieldX({
    super.key,
    this.hint,
    this.onTap,
    this.validator,
    this.hintWidget,
    this.decoration,
    required this.child,
    required this.items,
    required this.onChanged,
  });

  final String? hint;
  final Widget child;
  final Widget? hintWidget;

  final List<T> items;
  final VoidCallback? onTap;
  final ValueChanged<T?> onChanged;
  final InputDecoration? decoration;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: hintWidget ?? Text(hint!),
      items: items
          .map<DropdownMenuItem<T>>((e) => DropdownMenuItem<T>(
                value: e,
                child: child,
                onTap: onTap,
              ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: decoration ?? inputDecoration(context: context),
    );
  }
}
