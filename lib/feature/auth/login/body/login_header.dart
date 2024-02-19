import 'package:flutter/material.dart';
import 'package:package/package.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInSideAnimation(
          delay: 3,
          direction: FadeInDirection.rtl,
          fadeOffset: -50,
          child: Text(
            'LOG IN',
            style: StyleX.background(context).copyWith(
              fontWeight: fwb,
              fontSize: getFontSize(30),
              fontFamily: familyUrbanist,
            ),
          ),
        ),
        FadeInSideAnimation(
          delay: 5.5,
          direction: FadeInDirection.rtl,
          fadeOffset: -20,
          child: Text(
            'Let\'s login for explore \ncontinues',
            style: StyleX.gentiumPlus(context).copyWith(
              color: kOrangeLight,
              letterSpacing: 1.3,
              fontSize: getFontSize(20),
            ),
          ),
        )
      ],
    );
  }
}
