import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package/package.dart';

class ButtonXX extends StatelessWidget {
  final String label;
  final bool loading;
  late final Color? colour, textColor;
  final FutureOr<void> Function()? onPressed;

  ButtonXX({
    Key? key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.colour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    this.textColor = colour == null
        ? Theme.of(context).colorScheme.onBackground
        : Theme.of(context).indicatorColor;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          side: MaterialStatePropertyAll(BorderSide(color: color.shadow)),
          shape: MaterialStatePropertyAll(roundBorder10),
          fixedSize: const MaterialStatePropertyAll(Size.fromWidth(370)),
          padding: MaterialStatePropertyAll(15.pxVH),
          backgroundColor: MaterialStatePropertyAll(color.shadow)),
      child: loading
          ? CupertinoActivityIndicator(color: isDark ? kWhite : color.shadow)
          : FittedBox(
              child: Text(
                label,
                style: StyleX.urbanistSemiBold(context).copyWith(
                  color: isDark ? kWhite : color.background,
                  fontSize: getFontSize(18),
                ),
              ),
            ),
    );
  }
}

class DynamicFilledButton extends StatelessWidget {
  const DynamicFilledButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.color,
      this.loading = false});

  final Widget child;
  final Color? color;
  final bool loading;
  final FutureOr<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .8,
      child: SizedBox(
        height: 48,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: color ?? Theme.of(context).colorScheme.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: loading ? null : onPressed,
          child: loading
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : child,
        ),
      ),
    );
  }
}
