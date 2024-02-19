import 'package:flutter/material.dart';
import 'package:package/package.dart';

class SvgImg extends StatelessWidget {
  SvgImg(
      {super.key,
      required this.imgSrc,
      this.width = 25,
      this.height = 25,
      this.onPressed,
      this. colour,
      this.label = ''});

  final String imgSrc, label;
  final double width, height;
    final Color? colour;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
   var color = colour ?? Theme.of(context).colorScheme.onBackground;

    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: edgeInsets5,
        child: SvgPicture.string(
          imgSrc,
          width: width,
          height: height,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          semanticsLabel: label,


        ),
      ),
    );
  }
}
