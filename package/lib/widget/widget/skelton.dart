import 'package:flutter/material.dart';
import 'package:package/constant/constant.dart';

import '../../constant/decoration/padding_margin.dart';


class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, this.layer = 1})
      : super(key: key);

  final double? height, width;
  final int layer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(p16 / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.04 * layer),
          borderRadius: const BorderRadius.all(Radius.circular(p16))),
    );
  }
}

class SkeletonCircle extends StatelessWidget {
  const SkeletonCircle({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      // padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
