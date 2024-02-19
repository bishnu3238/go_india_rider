import 'package:flutter/material.dart';
import 'package:package/package.dart';

class StarShapeImage extends StatelessWidget {
  const StarShapeImage(
      {super.key,
      this.widthFactor = 0.6,
      required this.src,
      this.width = 100,
      this.height = 100,
      this.imgType = ImgType.network});
  final ImgType imgType;
  final String src;
  final double widthFactor, width, height;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Hero(
        tag: Key(src),
        child: Container(
          height: width,
          width: height,
          decoration: ShapeDecoration(
            shape: const StarBorder(
              innerRadiusRatio: 0.9,
              pointRounding: 0.2,
              points: 10,
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imgType == ImgType.local
                  ? const AssetImage('assets/images/model.jpg')
                  : imgType == ImgType.network
                      ? CachedNetworkImageProvider(src) as ImageProvider
                      : const AssetImage(ImgPac.placeHolderImage),
            ),
            shadows: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(.8),
                blurRadius: 120,
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                spreadRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
