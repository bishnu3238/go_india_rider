import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:package/package.dart';

/// first Step 1: declare the controller;
/// late final TextEditingController controller;
///
/// second Step 2:
/// initialize the controller (with [value] if have)
///
///  phoneController =
///           TextEditingController(text: provider.formState.phone.value)
///             ..addListener(() => provider.phoneNoChanged(phoneController.text),
///             );
///
/// third Step 3:
/// widget to call whenever show phone field ...
///
///  PhoneField(
///     hint: 'Phone Number',
///     controller: phoneController,
///     onSaved: (s) => FocusScope.of(context).requestFocus(passWordNode),
///     validator: provider.phoneValidator,
///    ),
///
///  String? phoneValidator(PhoneNumber? value) =>
///      formState.phone.validator(value?.number ?? '')?.text;
class PhoneField extends StatelessWidget {
  final String hint;
  final String? label;
  final Color? fillColor;
  final double radius;
  final Function(String)? onDone;
  final FormFieldValidator<PhoneNumber> validator;
  final Function(PhoneNumber)? onNumberChange;
  final Function(Country)? onCountryChange;
  final Function(PhoneNumber?)? onSaved;
  final bool showFlag;
  final TextEditingController? controller;

  const PhoneField(
      {Key? key,
      this.controller,
      required this.hint,
      this.label,
      this.radius = 5,
      this.fillColor,
      this.onNumberChange,
      this.onCountryChange,
      this.onSaved,
      required this.validator,
      this.onDone,
      this.showFlag = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context) ;
    return IntlPhoneField(
      enabled: true,
      style: StyleX.background(context),
      controller: controller,
      showCountryFlag: showFlag,
      initialCountryCode: "IN",
      flagsButtonPadding: 8.px,
      dropdownTextStyle: StyleX.background(context),
      cursorColor: color.colorScheme.tertiary,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      decoration: inputDecoration(
        hint: hint,
        label: label,
        radius: radius,
        fillColor: fillColor, context: context,
      ),
      onSaved: onSaved,
      onSubmitted: onDone,
      validator: validator,
      dropdownIconPosition: IconPosition.trailing,
      onChanged: onNumberChange,
      onCountryChanged: (cty) => onCountryChange!(cty),
      disableLengthCheck: true,
    );
  }
}
