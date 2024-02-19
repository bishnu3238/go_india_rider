import 'package:flutter/material.dart';

import '../../constant/decoration/padding_margin.dart';
import '../../constant/typedef/typedef.dart';

dynamic dummy(dynamic) => dynamic;

class FavIcon<Argument, ReturnType> extends StatelessWidget {
  final Argument? params;
  final IconData icon;
  final double size;
  final Widget? child;
  final Color? iconColor;
  final OnTap<ReturnType>? onTap;
  final OnIconPressed<Argument, ReturnType>? onIconPressed;

  const FavIcon({
    Key? key,
    this.onTap,
    this.params,
    this.child,
    required this.icon,
    this.onIconPressed,
    this.size = 24,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => onIconPressed!(params),
      child: Container(
        padding: edgeInsets5,
        margin: edgeInsets5,
        decoration: const BoxDecoration(),
        child: Icon(icon, color: iconColor, size: size),
      ),
    );
  }
}
