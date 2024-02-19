import 'package:flutter/material.dart';
 import 'package:package/package.dart';


class TagX extends StatelessWidget {
  const TagX({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.0.pxSy,
      height: 16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: FittedBox(
        child: Text(
          tag,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: StyleX.plus (context),
        ),
      ),
    );
  }
}
