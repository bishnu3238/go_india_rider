import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapState {
  final MapType mapType;

  GoogleMapState({this.mapType = MapType.normal});

  GoogleMapState copyWith({
    MapType? mapType,
  }) =>
      GoogleMapState(
        mapType: mapType ?? this.mapType,
      );

  @override
  String toString() {
    return 'GoogleMapState{mapType: $mapType}';
  }
}
