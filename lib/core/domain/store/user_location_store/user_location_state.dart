import 'package:equatable/equatable.dart';

import '../../entity/export.dart';


class UserLocationsState extends Equatable {
  final List<UserLocation> locations;

  const UserLocationsState({this.locations = const []});

  static UserLocationsState empty = const UserLocationsState(locations: []);

  UserLocation get currentLocation => locations
      .where((element) => element.locationType == LocationType.current)
      .first;

  UserLocation get destinationLocation => locations
      .where((element) => element.locationType == LocationType.destination)
      .first;

  List<UserLocation> get breakLocation => locations
      .where((element) => element.locationType == LocationType.breakJourney)
      .toList();

  UserLocationsState copyWith({
    List<UserLocation>? locations,
  }) =>
      UserLocationsState(
        locations: locations ?? this.locations,
      );

  @override
  List<Object?> get props => [locations];
}
