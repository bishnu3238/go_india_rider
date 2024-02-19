import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/domain/entity/export.dart';
import '../../../core/domain/repository/export.dart';
import '../../../core/domain/store/export.dart';
import '../../../utils/constant/global_variables.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final GoogleMapStore googleMapStore;
  final MapRepository googleMapRepository;
  final UserLocationStore userLocationStore;
  final MapControllerRepository mapControllerRepository;
  MapCubit({
    required this.googleMapStore,
    required this.userLocationStore,
    required this.googleMapRepository,
    required this.mapControllerRepository,
  }) : super(MapState.init());

  Set<Marker> get markers => userLocationStore.state.locations
      .map((e) => Marker(
            markerId: MarkerId(uid.v1()),
            position: e.latLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            infoWindow: const InfoWindow(
                title: 'MY Location', snippet: 'Current', anchor: Offset(1, 0)),
          ))
      .toSet();
  Map<PolylineId, Polyline> get polyLines => {
        PolylineId(uid.v1()): Polyline(
            polylineId: PolylineId(uid.v1()),
            points: userLocationStore.state.locations.map((e) => e.latLng).toList())
      };

  get initialCameraPosition => CameraPosition(
        target: userLocationStore.state.locations
            .firstWhere(
              (element) => element.locationType == LocationType.current,
              orElse: () => UserLocation.empty,
            )
            .latLng,
        zoom: 14,
      );

  getRoutes() async {
    googleMapRepository.requestPolyLines();
  }
}
