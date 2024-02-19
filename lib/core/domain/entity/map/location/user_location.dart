import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum LocationType { pickup, destination, current, breakJourney, unKnown }

class UserLocation extends Equatable {
  final String id;
  final double lat, lng;
  final LocationType locationType;

  const UserLocation({
    required this.id,
    required this.lat,
    required this.lng,
    this.locationType = LocationType.unKnown,
  });

  static UserLocation empty = const UserLocation(id: '0',lat: 0.0, lng: 0.0);

  bool get isEmpty => this == empty;
  LatLng get latLng => LatLng(lat, lng);

  UserLocation copyWith({
    double? lat,
    double? lng,
    LocationType? locationType,
  }) =>
      UserLocation(
        id: this.id,
          lat: lat ?? this.lat,
          lng: lng ?? this.lng,
          locationType: locationType ?? this.locationType);

  @override
  List<Object?> get props => [id, lat, lng, locationType];

  @override
  String toString() =>
      'UserLocation{id: $id, lat: $lat, lng: $lng, locationType: $locationType}';
}
