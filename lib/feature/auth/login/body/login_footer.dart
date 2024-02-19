import 'package:auto_size_text/auto_size_text.dart';
 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package/package.dart';

import '../core/login_cubit.dart';
import '../core/login_state.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OR(),
        SizedBox(height: 10),
        SocialLogins(),
        SizedBox(height: 20),
        LoginTerms(),
      ],
    );
  }
}

class SocialLogins extends StatelessWidget {
  const SocialLogins({super.key});

  @override
  Widget build(BuildContext context) {
    return BounceFromBottomAnimation(
      delay: 2,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          state.brand!.name.log;
          return MultiSocialButtons(
            showLoader: state.brand,
            onPressed: (brand) => context.read<LoginCubit>().socialLogin(brand),
            brands: const [Brand.google, Brand.facebook, Brand.twitter],
          );
        },
      ),
    );
  }
}

class LoginTerms extends StatelessWidget {
  const LoginTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return BounceFromBottomAnimation(
      delay: 3,
      child: AutoSizeText.rich(
        textAlign: TextAlign.center,
        TextSpan(
          style: StyleX.shadow(context),
          text: 'joining our app means you agree with out ',
          children: [
            TextSpan(
                text: 'Terms of Use',
                style: StyleX.underline,
                recognizer: TapGestureRecognizer()

                /// TODO: uncomment later;
                // ..onTap = () => context.pushNamed(RouteName.termAndCondition.name)
                ),
            const TextSpan(text: ' and '),
            TextSpan(
                text: 'Privacy Policy',
                style: StyleX.underline,
                recognizer: TapGestureRecognizer()

                /// TODO: uncomment later;
                // ..onTap = () => context.pushNamed(RouteName.termAndCondition.name)
                ),
          ],
        ),
      ),
    );
  }
}

class OR extends StatelessWidget {
  const OR({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: 2, color: Theme.of(context).colorScheme.outline)),
        Container(
          alignment: Alignment.center,
          child: Text("  or login with  ", style: StyleX.grey),
        ),
        Expanded(
            child: Container(
                height: 2, color: Theme.of(context).colorScheme.outline)),
      ],
    );
  }
}
