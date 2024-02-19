import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.onTap, this.size});
  final VoidCallback? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: Padding(
        padding: edgeInsets5,
        child: SvgPicture.string(
          fit: BoxFit.cover,
          ImgPac.angleLeftSvg,
          width: size ?? 18,
          height: size ?? 18,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onBackground,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
