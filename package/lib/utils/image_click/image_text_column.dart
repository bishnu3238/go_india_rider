import 'package:flutter/material.dart';
import 'package:package/constant/constant.dart';

import '../../widget/widget/fav_icon.dart';


class ImageTextColumn extends StatelessWidget {
  const ImageTextColumn({
    super.key,
    this.primary,
    this.secondary,
    this.icon,
    this.label,
    this.onIconPressed,
    this.onTap,
  });
  final Widget? primary;
  final Widget? secondary;
  final IconData? icon;
  final String? label;
  final OnIconPressed? onIconPressed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        primary ??
            FavIcon(
              icon: icon!,
              onIconPressed: onIconPressed,
              onTap: onTap,
            ),
        secondary ??
            Text(
              label ?? "",
              style: StyleX.quando(context),
            ),
      ],
    );
  }
}