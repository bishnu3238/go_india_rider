import 'package:flutter/material.dart';



class LineRow extends StatelessWidget {
  const LineRow({
    super.key,
    this.trailing,
    this.trailingText,
    this.icon,
    this.label,
    this.title,
    this.textStyle,
    this.trailingStyle,
  }) : assert(label != null || title != null,
            'provide label text or title widget');

  final IconData? icon;
  final String? label, trailingText;
  final Widget? title;
  final Widget? trailing;
  final TextStyle? textStyle, trailingStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon == null
            ? const SizedBox.shrink()
            : Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
        title ?? Text(label!),
        const Spacer(),
        trailing ??
            (trailingText != null
                ? Text(trailingText!, style: trailingStyle)
                : const SizedBox.shrink()),
      ],
    );
  }
}
