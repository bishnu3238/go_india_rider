import 'package:flutter/material.dart';
import 'package:package/package.dart';

class BellIcon extends StatelessWidget {
  const BellIcon({super.key, this.label, this.onPress});
  final String? label;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FavIcon(onTap: onPress, icon: Icons.notifications),
        label == null ? SizedBox.shrink() : _NotificationCount(label: label),
      ],
    );
  }
}

class _NotificationCount extends StatelessWidget {
  const _NotificationCount({required this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 8,
      child: Badge(
        padding: edgeInsets,
        label: CircleAvatar(
          radius: 8,
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          child: Text(
            label!,
            textAlign: TextAlign.center,
            style: StyleX.grandBold(context).copyWith(
              color: Theme.of(context).colorScheme.background,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
