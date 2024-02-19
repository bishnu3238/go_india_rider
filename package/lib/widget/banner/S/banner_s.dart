import 'package:flutter/material.dart';
import 'package:package/package.dart';



class BannerS extends StatelessWidget {
  const BannerS(
      {Key? key,
      required this.image,
      required this.press,
      required this.children,
      this.type = ImgType.network})
      : super(key: key);

  final String image;
  final ImgType type;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            type == ImgType.local
                ? ShowLocalImage(imageUrl: image)
                : NetworkImageWithLoader(image, radius: 0),
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
