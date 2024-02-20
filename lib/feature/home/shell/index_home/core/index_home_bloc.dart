import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

 import '../../../../../core/domain/entity/export.dart';
import '../../../../../core/domain/repository/export.dart';
import '../../../../../core/domain/store/export.dart';
import '../../../../../utils/constant/global_variables.dart';
import 'index_home_event.dart';
import 'index_home_state.dart';

class IndexHomeBloc extends Bloc<IndexHomeEvent, IndexHomeState> {
  final UserLocationStore userLocationStore;
  final LocationRepository locationRepository;

  final  MapRepository mapRepository;
  final MapControllerRepository mapControllerRepository;
  IndexHomeBloc({
    required this.userLocationStore,
    required this.locationRepository,
    required this.mapRepository,
    required this.mapControllerRepository,
  }) : super(IndexHomeState.init(const LatLng(0.0, 0.0))) {
    on<IndexHomeMapTypeChangeEvent>(_onMapTypeChangeEvent);
  }

  Stream<Position> newPosition = Geolocator.getPositionStream();

  get initialCameraPosition => CameraPosition(
        target: userLocationStore.state.locations
            .firstWhere(
              (element) => element.locationType == LocationType.current,
              orElse: () => UserLocation.empty,
            )
            .latLng,
        zoom: 14,
      );

  Set<Marker> get markers => userLocationStore.state.locations
      .map((e) => Marker(
            markerId: MarkerId(uid.v1()),
            position: e.latLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            infoWindow: const InfoWindow(
                title: 'MY Location', snippet: 'Current', anchor: Offset(1, 0)),
          ))
      .toSet();

  Set<Polyline> get polyLines => {
        Polyline(
            polylineId: PolylineId(uid.v1()),
            points: userLocationStore.state.locations.map((e) => e.latLng).toList())
      };

  FutureOr<void> _onMapTypeChangeEvent(
      IndexHomeMapTypeChangeEvent event, Emitter<IndexHomeState> emit) {
    emit(state.copyWith(mapType: event.type));
  }

  void checkingUserLocation(BuildContext context) async {
    await locationRepository.getCurrentLocation();
  }
}
