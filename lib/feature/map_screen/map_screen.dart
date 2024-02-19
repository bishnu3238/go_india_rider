 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/domain/store/export.dart';
import 'core/map_cubit.dart';
import 'core/map_state.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapCubit cubit;

  @override
  void initState() {
    super.initState();

    init(context);
  }

  init(BuildContext context) {
    cubit = context.read<MapCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(builder: (context, state) {
      return GoogleMap(
        markers: cubit.markers,
        // circles: _circles,
        onMapCreated: _onMapCreated,
        onCameraMove: _onCameraMove,
        onCameraIdle: _onCameraIdle,
        gestureRecognizers: _gestureRecognizers,
        initialCameraPosition: cubit.initialCameraPosition,
        polylines: Set<Polyline>.of(cubit.polyLines.values),
        mapType: context.watch<GoogleMapStore>().state.mapType,
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    context.read<MapCubit>().mapControllerRepository.controller.complete(controller);
  }

  void _onCameraMove(CameraPosition? cameraPosition) {}

  void _onCameraIdle() {}

  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers = {
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
  };
}
