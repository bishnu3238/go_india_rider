import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpFieldX extends StatelessWidget {
  const OtpFieldX(
      {super.key,
      required this.controller,
      this.onSubmit,
      this.onChange,
      this.onComplete,
      this.validator,
      this.hint = "#"});
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChange, onComplete, onSubmit;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      autofocus: true,

      senderPhoneNumber: '',
      preFilledWidget: Text(hint),
      keyboardType: TextInputType.number,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      onChanged: onChange,
      onCompleted: onComplete,
      onSubmitted: onSubmit,
      controller: controller,
      validator: validator,
    );
  }
}
