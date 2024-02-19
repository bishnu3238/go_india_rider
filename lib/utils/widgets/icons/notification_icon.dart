import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../route/route_name.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BellIcon(
      onPress: () => context.push(RouteName.notification.path),
    );
  }
}
