import 'package:flutter/material.dart';
import 'package:package/package.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.hint = "password",
    this.label = '',
    this.controller,
    this.focusNode,
    this.onFieldSubmit,
    required this.showPassword,
    this.validator,
    this.onPasswordChange,
    this.togglePasswordVisibility,
  });

  final String label, hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool showPassword;
  final VoidCallback? onFieldSubmit;
  final FormFieldValidator<String>? validator;
  final Function(String)? onPasswordChange;
  final VoidCallback? togglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: showPassword,
      onFieldSubmitted: (pass) => onFieldSubmit,
      decoration: _inputDecoration(context),
      onChanged: onPasswordChange,
      validator: validator,
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      isDense: true,
      hintText: hint,
      labelText: label,
      alignLabelWithHint: true,
      hintStyle: StyleX.shadow(context),
      contentPadding: 15.12.pxSy,
      labelStyle: StyleX.bodyLarge(context),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: showPassword ? Icon(Icons.lock) : const Icon(Icons.lock_open),
      suffixIcon: InkWell(
        onTap: togglePasswordVisibility,
        child: Icon(showPassword ? Icons.visibility_off : Icons.visibility,
            color: showPassword ? kGreen : kError),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(5)),
      prefixIconConstraints: const BoxConstraints(
        maxWidth: 150,
        maxHeight: 50,
        minWidth: 38,
        minHeight: 38,
      ),
    );
  }
}
