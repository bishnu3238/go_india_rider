import 'package:flutter/material.dart';
import 'package:package/package.dart';

class Notifier {
  errorMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kError,
            duration: oneSecond,
          ),
        );
  successMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).colorScheme.primary,
            duration: oneSecond,
          ),
        );
  infoMessage({required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: StyleX.plus(context).copyWith(color: kDark),
            ),
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            duration: oneSecond,
          ),
        );
}
