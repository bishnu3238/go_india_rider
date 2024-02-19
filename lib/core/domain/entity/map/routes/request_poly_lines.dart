import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../repository/export.dart';

class RouteDirectionModel extends Equatable {
  final Distance distance;
  final RouteDuration duration;
  final String startAddress, endAddress;
  final LatLng startLatLng, endLatLng;
  final List<RouteSteps> steps;

  const RouteDirectionModel({
    required this.distance,
    required this.duration,
    required this.startAddress,
    required this.endAddress,
    required this.startLatLng,
    required this.endLatLng,
    required this.steps,
  });

  static RouteDirectionModel empty = RouteDirectionModel(
    distance: Distance.empty,
    duration: RouteDuration.empty,
    startAddress: '',
    endAddress: '',
    startLatLng: const LatLng(0.0, 0.0),
    endLatLng: const LatLng(0.0, 0.0),
    steps: [RouteSteps.empty],
  );
  @override
  String toString() {
    return 'RouteDirectionModel{ distance: $distance, duration: $duration, startAddress: $startAddress, endAddress: $endAddress, startLatLng: $startLatLng, endLatLng: $endLatLng, steps: $steps,}';
  }

  RouteDirectionModel copyWith({
    Distance? distance,
    RouteDuration? duration,
    String? startAddress,
    String? endAddress,
    LatLng? startLatLng,
    LatLng? endLatLng,
    List<RouteSteps>? steps,
  }) {
    return RouteDirectionModel(
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      startAddress: startAddress ?? this.startAddress,
      endAddress: endAddress ?? this.endAddress,
      startLatLng: startLatLng ?? this.startLatLng,
      endLatLng: endLatLng ?? this.endLatLng,
      steps: steps ?? this.steps,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'distance': distance,
      'duration': duration,
      'startAddress': startAddress,
      'endAddress': endAddress,
      'startLatLng': startLatLng,
      'endLatLng': endLatLng,
      'steps': steps,
    };
  }

  factory RouteDirectionModel.fromMap(Map<String, dynamic> map) {
    return RouteDirectionModel(
      distance: map['distance'] as Distance,
      duration: map['duration'] as RouteDuration,
      startAddress: map['startAddress'] as String,
      endAddress: map['endAddress'] as String,
      startLatLng: map['startLatLng'] as LatLng,
      endLatLng: map['endLatLng'] as LatLng,
      steps: map['steps'] as List<RouteSteps>,
    );
  }

  @override
  List<Object?> get props =>
      [distance, duration, startAddress, endAddress, startLatLng, endLatLng, steps];
}

class RouteSteps extends Equatable {
  final Distance distance;
  final RouteDuration duration;
  final LatLng startLatLng, endLatLng;
  final RoutePolyline polyline;
  final TravelMode travelMode;

  const RouteSteps({
    required this.distance,
    required this.duration,
    required this.startLatLng,
    required this.endLatLng,
    required this.polyline,
    required this.travelMode,
  });

  static RouteSteps empty = RouteSteps(
    distance: Distance.empty,
    duration: RouteDuration.empty,
    startLatLng: const LatLng(0.0, 0.0),
    endLatLng: const LatLng(0.0, 0.0),
    polyline: RoutePolyline.empty,
    travelMode: TravelMode.driving,
  );

  @override
  String toString() {
    return 'Steps{ distance: $distance, duration: $duration, startLatLng: $startLatLng, endLatLng: $endLatLng, polyline: $polyline, travelMode: $travelMode,}';
  }

  RouteSteps copyWith({
    Distance? distance,
    RouteDuration? duration,
    LatLng? startLatLng,
    LatLng? endLatLng,
    RoutePolyline? polyline,
    TravelMode? travelMode,
  }) {
    return RouteSteps(
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      startLatLng: startLatLng ?? this.startLatLng,
      endLatLng: endLatLng ?? this.endLatLng,
      polyline: polyline ?? this.polyline,
      travelMode: travelMode ?? this.travelMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'distance': distance,
      'duration': duration,
      'startLatLng': startLatLng,
      'endLatLng': endLatLng,
      'polyline': polyline,
      'travelMode': travelMode,
    };
  }

  factory RouteSteps.fromMap(Map<String, dynamic> map) {
    return RouteSteps(
      distance: map['distance'] as Distance,
      duration: map['duration'] as RouteDuration,
      startLatLng: map['startLatLng'] as LatLng,
      endLatLng: map['endLatLng'] as LatLng,
      polyline: map['polyline'] as RoutePolyline,
      travelMode: map['travelMode'] as TravelMode,
    );
  }

  @override
  List<Object?> get props =>
      [distance, duration, startLatLng, endLatLng, polyline, travelMode];
}

class Distance extends Equatable {
  final String km;
  final double meter;

  const Distance({
    required this.km,
    required this.meter,
  });

  static Distance empty = const Distance(km: '0 km', meter: 0);

  @override
  String toString() {
    return 'Distance{ km: $km, meter: $meter,}';
  }

  Distance copyWith({
    String? km,
    double? meter,
  }) {
    return Distance(
      km: km ?? this.km,
      meter: meter ?? this.meter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'km': km,
      'meter': meter,
    };
  }

  factory Distance.fromMap(Map<String, dynamic> map) {
    return Distance(
      km: map['km'] as String,
      meter: map['meter'] as double,
    );
  }

  @override
  List<Object?> get props => [km, meter];
}

class RouteDuration extends Equatable {
  final String minute;
  final double second;

  const RouteDuration({
    required this.minute,
    required this.second,
  });

  static RouteDuration empty = const RouteDuration(minute: '0 mins', second: 0);

  @override
  String toString() {
    return 'RouteDuration{ minute: $minute, second: $second,}';
  }

  RouteDuration copyWith({
    String? minute,
    double? second,
  }) {
    return RouteDuration(
      minute: minute ?? this.minute,
      second: second ?? this.second,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'minute': minute,
      'second': second,
    };
  }

  factory RouteDuration.fromMap(Map<String, dynamic> map) {
    return RouteDuration(
      minute: map['minute'] as String,
      second: map['second'] as double,
    );
  }
  @override
  List<Object?> get props => [minute, second];
}

class RoutePolyline extends Equatable {
  final List<LatLng> points;

  const RoutePolyline({
    required this.points,
  });

  static RoutePolyline empty = const RoutePolyline(points: []);

  @override
  String toString() {
    return 'RoutePolyline{ points: $points,}';
  }

  RoutePolyline copyWith({
    List<LatLng>? points,
  }) {
    return RoutePolyline(
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }

  factory RoutePolyline.fromMap(Map<String, dynamic> map) {
    return RoutePolyline(
      points: map['points'] as List<LatLng>,
    );
  }

  @override
  List<Object?> get props => [points];
}
