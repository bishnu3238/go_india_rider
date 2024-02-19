import 'package:flutter/material.dart';

import '../../../package.dart';

class ShowNetImage extends StatelessWidget {
  const ShowNetImage({
    super.key,
    this.color,
    required this.imageUrl,
    required this.fit,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final BoxFit fit;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (ctx, img) => Image.asset(ImgPac.placeHolderImage),
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      color: color,
      errorWidget: (ctx, obj, trash) {
        return Image.asset(
          ImgPac.placeHolderImage,
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      },
    );
  }
}

class NetworkImageWithLoader extends StatelessWidget {
  const NetworkImageWithLoader(
    this.src, {
    Key? key,
    this.fit = BoxFit.cover,
    this.radius = p16,
    this.borderRadius,
  }) : super(key: key);

  final String src;
  final BoxFit fit;
  final double radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: src,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            border: Border.all(color: Theme.of(context).colorScheme.background, width: 2),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        color: Theme.of(context).colorScheme.background,
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => const Skeleton(),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.1),
            border: Border.all(color: Theme.of(context).colorScheme.tertiary),
            image: DecorationImage(
              fit: fit,
              image: const AssetImage(ImgPac.placeHolderImage),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleImageShower extends StatelessWidget {
  CircleImageShower(
    this.src, {
    super.key,
  this.bgColor,
    this.fit = BoxFit.cover,
    this.radius = p16,
    this.filter,
  }) {
  }

  final String src;
  final BoxFit fit;
  late final Color? bgColor;
  final double radius;
  final ColorFilter? filter;

  @override
  Widget build(BuildContext context) {
   var bg = bgColor ?? Theme.of(context).colorScheme.onPrimary.withOpacity(0.2);

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: src,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
            image: DecorationImage(
              fit: fit,
              colorFilter: filter,
              image: imageProvider,
            ),
          ),
        ),
        color: Theme.of(context).colorScheme.background,
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => const Skeleton(),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.background.withOpacity(0.1),
            border: Border.all(color: Theme.of(context).colorScheme.tertiary),

            // image: DecorationImage(
            //   fit: fit,
            // image:
            //     const AssetImage(ImgPac.placeHolderImage, package: 'package'),
            //  ),
          ),
          child: SvgPicture.string(
            ImgPac.userIconSvg,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.outline,
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}
