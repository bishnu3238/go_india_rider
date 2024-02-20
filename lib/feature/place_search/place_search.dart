import 'package:flutter/material.dart';
import 'body/pick_location_from_map.dart';
import 'body/place_map_screen.dart';
import 'body/place_search_appbar.dart';
import 'body/place_search_bottom_bar.dart';

class PlaceSearch extends StatelessWidget {
  const PlaceSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            const PlaceSearchAppBar(),
            const PickLocationFromMap(),
          ],
          body: const PlaceMapScreen(),
        ),
      ),
      // bottomSheet: const PlaceSearchBottomBar(),
    );
  }
}
