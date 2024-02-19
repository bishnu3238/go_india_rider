import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/package.dart';

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({
    super.key,
    this.title,
    required this.icon,
    required this.onPress,
    this.titleWidget,
    this.endWidget,
    this.textColor,
  }) : assert(title != null || titleWidget != null,
            'title or titleWidget must be provided [profile_manu_widget.dart]') {
    endIcon = endWidget == null ? true : false;
  }

  final String? title;
  final IconData icon;
  late final bool endIcon;
  final VoidCallback onPress;
  final Widget? titleWidget;
  final Widget? endWidget;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor =
        isDark ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: titleWidget ??
          Text(title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.apply(color: textColor)),
      trailing: endWidget ??
          (endIcon
              ? Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(FontAwesomeIcons.angleRight,
                      size: 18.0, color: Colors.grey))
              : null),
    );
  }
}
