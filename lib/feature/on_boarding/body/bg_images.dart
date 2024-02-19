import 'package:flutter/material.dart';
import 'package:package/package.dart';

import '../../../core/constant/image.dart';

class BgImg extends StatelessWidget {
  const BgImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 0,
      child: FadeInSideAnimation(
        delay: 3.6,
        direction: FadeInDirection.btt,
        fadeOffset: 20,
        child: Image.asset(
          ImgCon.bg,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: getVerticalSize(100),
        ),
      ),
    );
  }
}

class BgImg1 extends StatelessWidget {
  const BgImg1({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 10,
      child: FadeInSideAnimation(
        delay: 2.6,
        direction: FadeInDirection.ttb,
        fadeOffset: 20,
        child: Image.asset(
          ImgCon.pin,
          fit: BoxFit.cover,
          width: getHorizontalSize(100),
          height: getVerticalSize(100),
        ),
      ),
    );
  }
}

