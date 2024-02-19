
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../core/index_home_bloc.dart';
import '../core/index_home_state.dart';
import 'map_current_button.dart';
import 'map_view.dart';
import 'map_search_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexHomeBloc, IndexHomeState>(
        builder: (context, state) {

      return const SliverFillRemaining(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.passthrough,
          children: [
            MapView(),
            MapSearchBar(),
            MapCurrentButton(),

          ],
        ),
      );
    });
  }
}
