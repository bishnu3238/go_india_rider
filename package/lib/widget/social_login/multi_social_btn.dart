import 'package:flutter/material.dart';
import 'package:package/package.dart';

class MultiSocialButtons extends StatelessWidget {
  /// A group of authentication buttons.
  const MultiSocialButtons({
    super.key,
    required this.onPressed,
    required this.brands,
    this.text = 'Continue with {brand}',
    this.backgroundColor,
    this.shape,
    this.showLoader,
    this.splashEffect = true,
    this.customImage,
    this.imageHeight = 21,
    this.padding = edgeInsets,
  });

  /// The function called when the button is pressed, the brand (ex: Method.google) is passed as a parameter
  final Function(Brand) onPressed;

  /// The list of brands
  final List<Brand> brands;

  /// The text of the button, you can use {brand} to display the brand name
  final String text;

  /// The background color of the button
  final Color? backgroundColor;

  /// The button's shape with options to specify borders (color, width) and corner radius
  final OutlinedBorder? shape;

  /// Show the loader of a specific button
  final Brand? showLoader;

  /// Show a splash effect when the button is pressed, does not work with a dark background
  final bool splashEffect;

  /// Change the default logo of the button, works only with AuthButton class and Method.custom
  final Image? customImage;

  /// The height of the image associated with the button
  final double imageHeight;

  /// Manage the space around the button
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Column(
      children: [
        for (var brand in brands)
          Padding(
            padding: 0.5.pxSy,
            child: Card(
              child: SocialButton(
                onPressed: (b) => onPressed(b),
                brand: brand,
                text: text,
                bgColor: backgroundColor ??
                    (isDark
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.scrim),
                shape: shape,
                showLoader: showLoader == brand,
                splashEffect: splashEffect,
                customImage: customImage,
                imageHeight: imageHeight,
                padding: padding,
              ),
            ),
          ),
      ],
    );
  }
}
