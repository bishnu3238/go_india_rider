import 'package:flutter/material.dart';

import '../../package.dart';

/// first Step 1: declare the controller;
/// late final TextEditingController controller;
///
/// second Step 2:
/// initialize the controller (with [value] if have)
///
///  controller =
///           TextEditingController(text: provider.formState.param.value)
///             ..addListener(() => provider.valueChanged(controller.text),
///             );
///
/// third Step 3:
/// widget to call whenever show phone field ...
///
///  TextFieldX(
///     hint: 'hint',
///     controller: controller,
///     onSaved: (s) => FocusScope.of(context).requestFocus(passWordNode),
///     validator: provider.validator,
///    ),
///
///  String? validator(PhoneNumber? value) =>
///      formState.param.validator(value ?? '')?.text;

class TextFieldX extends StatelessWidget {
  final String? hint, label;
  final bool readOnly, showBorder;
  final double radius;
  final int maxLines;

  final Widget? prefix, suffix;
  final IconData? prefixIcon, suffixIcon;

  final VoidCallback? onTap;
  final Function(String)? onChange;

  final TextInputType inputType;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  final TextCapitalization capitalization;
  final TextEditingController? controller;

  const TextFieldX({
    super.key,
    this.hint = '',
    this.label = '',
    this.maxLines = 1,
    this.readOnly = false,
    this.showBorder = true,
    this.onTap,
    this.onChange,
    this.validator,
    this.prefix,
    this.suffix,
    this.radius = 5,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.decoration,
    this.inputType = TextInputType.name,
    this.capitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        maxLines: maxLines,
        onChanged: onChange,
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        textCapitalization: capitalization,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onSaved: (d) => FocusScope.of(context).nextFocus(),
        decoration: decoration ??
            (showBorder
                ? inputDecoration(
                    hint: hint,
                    label: label,
                    prefix: prefix,
                    suffix: suffix,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon, context: context,
                  )
                : inputDecorationWithoutBorder(
                    hint: hint,
                    label: label,
                    prefix: prefix,
                    suffix: suffix,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon, context: context,
                  )));
  }
}
