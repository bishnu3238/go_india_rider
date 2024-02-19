import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../route/route_name.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => context
              .pushNamed( RouteName.forgetPassword.subCName),
          child: Text(
              "forgot password ?",
              style: StyleX.bodySmall
          ),
        )
      ],
    );
  }
}
