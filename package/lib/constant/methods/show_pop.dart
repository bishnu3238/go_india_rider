import 'package:flutter/material.dart';

import '../decoration/border_radius.dart';

Future showPop<T>({
  required BuildContext context,
  required List<PopupMenuEntry<T>> items,
  bool inPosition = true,
  double elevation = 8,
  ShapeBorder? shapeBorder ,
}) async {
  return await showMenu<T>(
    context: context,
    shape: shapeBorder ?? roundBorder10,
    elevation: elevation,
    position: position(context, inPosition),
    items: items,
  );
}

RelativeRect position(
  BuildContext context,
  bool inPosition,
) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  return inPosition
      ? RelativeRect.fromRect(
          Rect.fromPoints(
            overlay.localToGlobal(overlay.size.topRight(Offset.zero),
                ancestor: overlay),
            overlay.localToGlobal(overlay.size.topRight(Offset.zero),
                ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        )
      : RelativeRect.fill;
}

