import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:package/constant/constant.dart';

import '../core/index_home_bloc.dart';
import '../core/index_home_state.dart';

class MapCurrentButton extends StatelessWidget {
  const MapCurrentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexHomeBloc, IndexHomeState>(
      builder: (context, state) {
        return Positioned(
          bottom: 20,
          right: 10,
          child: FloatingActionButton.small(
            onPressed: () =>
                context.read<IndexHomeBloc>().locationRepository.getCurrentLocation(),
            elevation: 5,
            shape: roundBorder50,
            child: Icon(
              Icons.my_location_sharp,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        );
      },
    );
  }
}
