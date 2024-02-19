 import 'package:flutter/material.dart';

import '../../utils/size_utils.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
    key: key,
  );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? getVerticalSize(56),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(context),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    mediaQueryData.size.width,
    height ?? getVerticalSize(56),
  );
  _getStyle(BuildContext context) {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: getVerticalSize(56),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.shadow,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill,
}