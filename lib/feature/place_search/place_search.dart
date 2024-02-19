import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../map_screen/map_screen.dart';
import 'body/pick_location_from_map.dart';
import 'body/place_map_screen.dart';
import 'body/place_search_appbar.dart';
import 'body/place_search_suggestions.dart';
import 'core/place_search_cubit.dart';
import 'core/place_search_state.dart';

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
      // bottomSheet: BottomSheet(
      //     showDragHandle: true,
      //     enableDrag: true,
      //     onClosing: () {},
      //     builder: (context) => const PlaceSearchSuggestions()),
    );
  }
}
