import 'package:flutter/material.dart';
import 'package:package/package.dart';


class DeleteIcon extends StatelessWidget {
  const DeleteIcon({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.string(
        ImgPac.deleteIconSvg,
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onErrorContainer,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
