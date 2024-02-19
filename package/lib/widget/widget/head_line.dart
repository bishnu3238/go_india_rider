import 'package:flutter/material.dart';
import 'package:package/package.dart';

class HeadLine extends StatelessWidget {
  late final Color? color;
  final IconData? icon;
  final Widget? button;
  final String headline;
  final TextStyle? style;
  HeadLine({
    super.key,
    this.icon,
    this.style,
    this.button,
   this.color,
    required this.headline,
  }) {
  }

  @override
  Widget build(BuildContext context) {
 var color = this.color ?? Theme.of(context).colorScheme.background;

    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.fromLTRB(10, 8, 5, 5),
      color: color,
      child: IconTextButton(
          icon: icon, text: headline, style: style, button: button),
    );
  }
}

class HeadLine2 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Widget? title;
  final FavTextClass? favTextClass;
  const HeadLine2(
      {super.key,
      required this.text,
      this.title,
      this.style,
      this.favTextClass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsets16,
      child: Row(
        children: [
          title ?? Text(text, style: style ?? StyleX.plus(context)),
          const Spacer(),
          favTextClass != null
              ? InkWell(
                  onTap: favTextClass!.onTap,
                  child: FavTextIcon(
                    margin: edgeInsets,
                    isReversed: true,
                    size: 12,
                    icon: favTextClass!.icon,
                    label: favTextClass!.label,
                    style: StyleX.titleMedium(context),
                    iconColor: favTextClass!.color,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
