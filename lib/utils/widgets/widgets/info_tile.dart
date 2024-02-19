import 'package:flutter/material.dart';
import 'package:package/package.dart';

class InfoTile extends StatelessWidget {
  const InfoTile(
      {super.key,
      required this.text,
      this.icon,
      this.onTap,
      this.leading,
      this.trailing});

  final String text;
  final IconData? icon;
  final Widget? leading, trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: 8.16.pxSy,
        decoration: BoxDecoration(
            border: Border.symmetric(
          horizontal: BorderSide(color: color.outlineVariant),
        )),
        child: Row(
          children: [
            leading ??
                (icon == null
                    ? const SizedBox.shrink()
                    : Icon(icon, size: 20, color: color.outline)),
            const SizedBox(width: 10),
            Text(
              text,
              style: StyleX.plus(context),
            ),
            const Spacer(),
            trailing ?? Icon(Icons.arrow_right, color: color.outline),
          ],
        ),
      ),
    );
  }
}
