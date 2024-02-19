import 'package:flutter/material.dart';
import 'package:package/package.dart';
import '../../../utils/widgets/icons/back_icon.dart';
import 'place_search_fields.dart';

class PlaceSearchAppBar extends StatelessWidget {
  const PlaceSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double appbarHeight = kToolbarHeight * 3.5;
    var color = Theme.of(context).colorScheme;
    return SliverSafeArea(
      sliver: SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: SliverAppBarDelegate(
          minHeight: appbarHeight,
          maxHeight: appbarHeight,
          child: Container(
            color: color.surface,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackIcon(size: 30),
                    Text(
                      "Pick up",
                      style: StyleX.urbanist(context).copyWith(
                        fontSize: getFontSize(20),
                      ),
                    ),
                  ],
                ),
                const PlaceSearchFields()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
