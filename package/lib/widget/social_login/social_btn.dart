import 'package:flutter/material.dart';
import 'package:package/package.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onPressed,
    required this.brand,
    this.text = 'Continue with {brand}',
    this.bgColor,
    this.shape,
    this.textStyle,
    this.showLoader = false,
    this.splashEffect = true,
    this.customImage,
    this.imageHeight = 21,
    this.padding = edgeInsets,
  });

  final Brand brand;
  final String text;
  final Color? bgColor;
  final bool showLoader;
  final bool splashEffect;
  final Image? customImage;
  final double imageHeight;
  final TextStyle? textStyle;
  final OutlinedBorder? shape;
  final Function(Brand) onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: () => onPressed(brand),
        style: TextButton.styleFrom(
          elevation: 5,
          padding: 16.0.pxSy,
          shape: shape ?? roundBorder15,
          fixedSize: const Size(double.infinity, 53),
          foregroundColor:
              splashEffect ? Theme.of(context).indicatorColor : bgColor,
          backgroundColor: bgColor ?? Theme.of(context).colorScheme.onPrimary,
        ),
        child: Stack(
          children: [
            Center(
              child: showLoader
                  ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onBackground,
                    )
                  : Text(
                      text.replaceFirst('{brand}', brand.name),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle ?? StyleX.inter(context),
                    ),
            ),
            Align(
              alignment: Alignment.centerLeft,

              /// TODO: if dark mode then "X" or "Empty";
              child: Image.asset(
                "assets/logos/${brand.name}${brand == Brand.twitter && true ? "X" : ''}.png",
                height: imageHeight,
                package: 'package',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
