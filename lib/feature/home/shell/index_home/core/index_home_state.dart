import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IndexHomeState extends Equatable {
  final double zoom;
  final bool isLoading;
  final MapType mapType;
  final LatLng srcLocation;
  final LatLng? destinationLocation;

  final List<LatLng> routes;

  const IndexHomeState({
    required this.zoom,
    this.isLoading = false,
    this.mapType = MapType.normal,
    required this.srcLocation,
    this.destinationLocation,
    this.routes = const [],
  });

  static IndexHomeState init(LatLng src, [LatLng? destination]) =>
      IndexHomeState(
        zoom: 14,
        mapType: MapType.normal,
        srcLocation: src,
        destinationLocation: destination ?? const LatLng(0.0, 0.0),
      );

  @override
  String toString() {
    return 'IndexHomeState{zoom: $zoom, mapType: $mapType, srcLocation: $srcLocation, destinationLocation: $destinationLocation, routes: $routes}';
  }

  IndexHomeState copyWith(
      {double? zoom,
      LatLng? srcLocation,
        bool? isLoading,
      MapType? mapType,
      LatLng? destinationLocation,
      List<LatLng>? routes}) {
    return IndexHomeState(
      isLoading: isLoading?? this.isLoading,
      zoom: zoom ?? this.zoom,
      routes: routes ?? this.routes,
      mapType: mapType ?? this.mapType,
      srcLocation: srcLocation ?? this.srcLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
    );
  }

  @override
  List<Object?> get props =>
      [srcLocation, destinationLocation, zoom, mapType, routes];
}
