import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [AutoSizeText('resend Otp?')],
    );
  }
}
