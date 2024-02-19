import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class ImageX extends StatelessWidget {
  ImageX({
    super.key,
    required this.src,
    BorderRadiusGeometry? radius,
    this.height,
    this.width,
  }) {
    _radius = radius ?? radius12;
  }

  final String src;
  final double? height, width;
  late final BorderRadiusGeometry? _radius;


   ImageX.local(this.src, this.height, this.width, this._radius);


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _radius!,
    );
  }
}
