import 'package:flutter/material.dart';

import '../../constant/decoration/padding_margin.dart';
import '../../constant/decoration/text_style.dart';
import '../../constant/typedef/typedef.dart';

class FavTextClass {
  final String label;
  final IconData icon;
  final OnTap onTap;
  final Color? color;
  FavTextClass(
      {required this.label,
      required this.icon,
      required this.onTap,
      this.color});
}

class FavTextIcon<Argument, ReturnType> extends StatelessWidget {
  final Argument? params;
  final IconData icon;
  final double size;
  final String? label;
  final bool isReversed;
  final TextStyle? style;
  final Color? iconColor;
  final OnTap<ReturnType>? onTap;
  final EdgeInsets? padding, margin;
  final OnIconPressed<Argument, ReturnType>? onIconPressed;

  const FavTextIcon({
    Key? key,
    this.onTap,
    this.params,
    this.label,
    this.style,
    this.isReversed = false,
    required this.icon,
    this.onIconPressed,
    this.size = 24,
    this.iconColor,
    this.padding =edgeInsets5,
    this.margin =edgeInsets5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context) ;

    List<Widget> favTextIcon = [
      Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.primary,
        size: size,
      ),
      const SizedBox(width: 5),
      Text(
        label ?? "",
        style: style ??
            StyleX.gideonRoman(context).copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: size * 3 / 4,
                fontWeight: fw5),
      )
    ];
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        child: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: isReversed ? favTextIcon.reversed.toList() : favTextIcon,
          ),
        ),
      ),
    );
  }
}
