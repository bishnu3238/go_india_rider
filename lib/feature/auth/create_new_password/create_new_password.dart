import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../route/route_name.dart';
import '../../../utils/widgets/icons/back_icon.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackIcon()),
      body: SafeArea(
        child: Padding(
          padding: edgeInsets20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInAnimation(
                delay: 1.3,
                child: Text(
                  "Create new password",
                  style: StyleX.urbanist(context),
                ),
              ),
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 1.6,
                child: Text(
                  "Your new password must be unique from those previously used.",
                  style: StyleX.urbanistSemiBold(context),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    const FadeInAnimation(
                      delay: 1.9,
                      child: TextFieldX(
                        hint: 'New password',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const FadeInAnimation(
                      delay: 2.1,
                      child: TextFieldX(
                        hint: 'Confirm password',
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInAnimation(
                      delay: 2.4,
                      child: ButtonXX(
                        label: "Reset Password ",
                        onPressed: () {},
                        colour: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FadeInAnimation(
                delay: 2.5,
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
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
