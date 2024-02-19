
import 'package:flutter/material.dart';

import '../../../package.dart';

class ButtonX extends StatelessWidget {
  const ButtonX({
    super.key,
    required this.onTap,
    this.showLoading = false,
    this.label,
    this.loaderSize = 20,
    this.elevation = 0,
    this.child,
    this.buttonStyle,
    this.radius,
  });
  final VoidCallback? onTap;
  final String? label;
  final bool showLoading;
  final Widget? child;
  final double? loaderSize, elevation;
  final ButtonStyle? buttonStyle;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          style: buttonStyle ??
              ButtonStyle(
                elevation: MaterialStatePropertyAll(elevation),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: radius ?? radius5),
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size(getSize(500), getSize(45)),
                ),
                foregroundColor:
                    MaterialStatePropertyAll(Theme.of(context).indicatorColor),
                backgroundColor: MaterialStatePropertyAll(
                    isDark ? color.onPrimary : color.scrim),
              ),
          onPressed: onTap,
          child: showLoading
              ? Loading.threeBounce(size: loaderSize, context: context)
              : child ??
                  Text(
                    label!,
                    style: StyleX.titleMedium(context).copyWith(
                      color: isDark ? kWhite : color.background,
                    ),
                  ),
        ),
      ),
    );
  }
}
