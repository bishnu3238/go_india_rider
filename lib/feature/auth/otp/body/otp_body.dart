import 'package:flutter/material.dart';
 import 'package:package/package.dart';
import '../../../../utils/widgets/icons/back_icon.dart';
 import 'otp_header_field_btn.dart';
import 'resend_otp.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInAnimation(delay: 1, child: BackIcon(size: 40)),
            OtpHeader(),
            OtpFieldAndBtn(),
            ResendOtp(),
          ],
        ),
      ),
    );
  }
}
