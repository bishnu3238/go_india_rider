import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
    this.inActiveColor,
    this.indicatorType = IndicatorType.candle,
    this.activeColor = Colors.blueGrey,
  }) : super(key: key);

  final bool isActive;
  final IndicatorType indicatorType;
  final Color? inActiveColor, activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: thrMilliSecond,
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor ?? kGrey,
        shape: indicatorType == IndicatorType.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(p16)),
      ),
    );
  }
}

enum IndicatorType {
  circle(width: 4, height: 4, radius: radiusA12, isActive: false),
  square(width: 4, height: 4, radius: radiusA12, isActive: false),
  rectangle(width: 4, height: 4, radius: radiusA12, isActive: false),
  candle(width: 4, height: 4, radius: radiusA12, isActive: false),
  pipe(width: 4, height: 4, radius: radiusA12, isActive: false);

  final bool isActive;
  final double height, width;

  final BorderRadiusGeometry radius;
  const IndicatorType(
      {required this.height,
      required this.width,
      required this.radius,
      required this.isActive});
}
