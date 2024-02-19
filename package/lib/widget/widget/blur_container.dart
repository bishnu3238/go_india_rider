import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:package/constant/constant.dart';


import '../../utils/size_utils.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    required this.text,
    this.height = 40,
    this.width = 40,
    this.fontSize = 18,
  }) : super(key: key);

  final String text;
  final double height, width, fontSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius10,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: getVerticalSize(height),
          width: getHorizontalSize(width),
          color: Theme.of(context).colorScheme.outline,
          child: Center(
            child: Text(
              text,
              style: StyleX.tertiary(context),
            ),
          ),
        ),
      ),
    );
  }
}
