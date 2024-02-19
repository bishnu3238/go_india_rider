import 'package:flutter/material.dart';

import '../../constant/decoration/border_radius.dart';
import '../../constant/decoration/padding_margin.dart';

class ContainerX extends StatelessWidget {
  const ContainerX({
    super.key,
    this.showBorder = true,
    this.onPressed,
    this.child,
    this.style,
    this.size,
  });
  final Size? size;
  final Widget? child;
  final bool showBorder;
  final ButtonStyle? style;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: SizedBox.fromSize(
        size: size,
        child: child ?? const SizedBox(),
      ),
      style: style ??
          OutlinedButton.styleFrom(
            shape: roundBorder12,
            padding: edgeInsets10,
            side: BorderSide(
              width: 0.5,
              color: showBorder
                  ? Theme.of(context).colorScheme.onBackground.withOpacity(0.25)
                  : Colors.transparent,
            ),
          ),
    );
  }
}
