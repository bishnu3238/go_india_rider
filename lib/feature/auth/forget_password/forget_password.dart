 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../route/route_name.dart';
import '../../../utils/widgets/icons/back_icon.dart';
import '../widget/register_now.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FadeInAnimation(delay: 1, child: BackIcon()),
      ),
      body: SafeArea(
        child: Padding(
          padding: edgeInsets16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              FadeInAnimation(
                delay: 1.3,
                child: Text("Forgot Password?",
                    style: StyleX.urbanist(context) ),
              ),
              const SizedBox(height: 10),
              FadeInAnimation(
                delay: 1.6,
                child: Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: StyleX.gentiumPlus(context),
                ),
              ),
              const SizedBox(height: 15),
              Form(
                child: Column(
                  children: [
                    const FadeInAnimation(
                      delay: 1.9,
                      child: TextFieldX(hint: 'Enter your email or phone no'),
                    ),
                    const SizedBox(height: 30),
                    FadeInAnimation(
                      delay: 2.1,
                      child: ButtonXX(
                        label: "Send Code ",
                        onPressed: () => context.push(RouteName.login.path +
                            RouteName.forgetPassword.path +
                            RouteName.newPassword.path),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const RegisterNow()
            ],
          ),
        ),
      ),
    );
  }
}

