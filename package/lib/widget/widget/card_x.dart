import 'package:flutter/material.dart';
import 'package:package/package.dart';

class CardX extends StatelessWidget {
  const CardX({
    super.key,
    this.shape,
    this.onTap,
    this.child,
    this.color,
    this.padding = edgeInsets10,
    this.margin = edgeInsets,
    this.elevation = 0.2,
  });
  final Color? color;
  final Widget? child;
  final double elevation;
  final VoidCallback? onTap;
  final ShapeBorder? shape;
  final EdgeInsets padding, margin;

  factory CardX.column({
    ShapeBorder? borderRadius,
    double elevation = 0.2,
    required List<Widget> listOfWidget,
    EdgeInsets padding = edgeInsets10,
    EdgeInsets margin = edgeInsets10,
  }) =>
      CardX(
        elevation: elevation,
        padding: padding,
        shape: borderRadius,
        child: Padding(
          padding: margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listOfWidget,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          margin: margin,
          elevation: elevation,
          shape: shape ?? roundBorder12,
          child: child,
        ),
      ),
    );
  }
}
