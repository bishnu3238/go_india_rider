import 'package:flutter/material.dart';
import 'package:package/utils/size_utils.dart';

Future showSheet<T>(
    {required BuildContext context,
    VoidCallback? onClosing,
    required Widget Function(BuildContext) widget,
    bool showHandle = false,
    bool isScrolled = false}) async {
  return showModalBottomSheet<T>(
    context: context,
    useSafeArea: true,
    showDragHandle: showHandle,
    isScrollControlled: isScrolled,
    shape: getRoundedRadius(topL: 20, topR: 20),
    builder: (ctx) => BottomSheet(
      builder: widget,
      onClosing: onClosing ?? () {},
    ),
  );
}
