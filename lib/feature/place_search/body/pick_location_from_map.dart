import 'package:flutter/material.dart';
import 'package:go_india_rider/route/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

class PickLocationFromMap extends StatelessWidget {
  const PickLocationFromMap({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return SliverPersistentHeader(
      pinned: false,
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: getVerticalSize(50),
        maxHeight: getVerticalSize(50),
        child: Row(
          children: [
            OutlinedButton.icon(
              onPressed: () =>
                  context.pushNamed(RouteName.selectOnMap.subCName),
              style: OutlinedButton.styleFrom(
                elevation: 5,
                foregroundColor: color.onBackground,
                side: BorderSide(color: color.primary),
              ),
              icon: const Icon(Icons.location_on),
              label: const Text('Select from map'),
            )
          ],
        ),
      ),
    );
  }
}
