import 'package:flutter/material.dart';
import 'package:go_india_rider/utils/widgets/icons/svg_image.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

class MoreIcon extends StatelessWidget {
  const MoreIcon({super.key, this.onTap, this.size, required this.src});
  final VoidCallback? onTap;
  final double? size;
  final String src;

  factory MoreIcon.horizontal({VoidCallback? onTap}) =>
      MoreIcon(src: ImgPac.horizontalIconSvg, onTap: onTap);
  factory MoreIcon.vertical({VoidCallback? onTap}) =>
      MoreIcon(src: ImgPac.verticalIconSvg, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: Padding(
        padding: edgeInsets5,
        child: SvgImg(imgSrc: src),
      ),
    );
  }
}
