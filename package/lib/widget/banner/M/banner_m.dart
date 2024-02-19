import 'package:flutter/material.dart';
import 'package:package/widget/widget/image/image_shower.dart';

import '../../widget/image/show_net_image.dart';


class BannerM extends StatelessWidget {
  const BannerM(
      {Key? key,
      required this.image,
      required this.press,
      required this.children,
      this.imgType = ImgType.network})
      : super(key: key);

  final String image;
  final ImgType imgType;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          fit: StackFit.expand,
          children: [
            imgType == ImgType.network
                ? NetworkImageWithLoader(image, radius: 0)
                : ImageShower(imageUrl: image, imgType: imgType),
            // Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
