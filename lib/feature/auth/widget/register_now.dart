 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package/animation/fade_in_animation.dart';
import 'package:package/constant/decoration/text_style.dart';

import '../../../route/route_name.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 2.4,
      child: InkWell(
        onTap: () => context.push(RouteName.signup.path),
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account?",
                style: StyleX.urbanistMedium(context),
              ),
              TextButton(
                onPressed: () => context.push(RouteName.signup.path),
                child: Text(
                  "Register Now",
                  style: StyleX.urbanistSemiBold(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
