import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../entity/export.dart';
import 'user_location_state.dart';

class UserLocationStore extends Cubit<UserLocationsState> {
  UserLocationStore() : super(UserLocationsState.empty);

  setLocation(UserLocation currentLocation) {
    emit(state.copyWith(locations: [...state.locations, currentLocation]));
  }

  setPickUpLocation(UserLocation pickUpLocation) {
    UserLocation location = state.locations.firstWhere(
      (element) => element.locationType == LocationType.pickup,
      orElse: () => UserLocation.empty,
    );
    if (location.isEmpty) {
      emit(state.copyWith(locations: [...state.locations, pickUpLocation]));
    } else {
      var pickLocation = location.copyWith(
        lng: pickUpLocation.lng,
        lat: pickUpLocation.lat,
        locationType: LocationType.pickup,
      );
      emit(state.copyWith(locations: [...state.locations, pickLocation]));
    }
  }
  setDestinationLocation(UserLocation desnationLocation) {
    UserLocation location = state.locations.firstWhere(
      (element) => element.locationType == LocationType.destination,
      orElse: () => UserLocation.empty,
    );
    if (location.isEmpty) {
      emit(state.copyWith(locations: [...state.locations, desnationLocation]));
    } else {
      var destination = location.copyWith(
        lng: desnationLocation.lng,
        lat: desnationLocation.lat,
        locationType: LocationType.pickup,
      );
      emit(state.copyWith(locations: [...state.locations, destination]));
    }
  }


  void updateCurrentLocation(Position position) {
    state.locations
        .firstWhere((element) => element.locationType == LocationType.current)
        .copyWith(lat: position.latitude, lng: position.longitude);

    for (var element in state.locations) {
      if (element.locationType == LocationType.current) {
        element.copyWith(lat: position.latitude, lng: position.longitude);
      }
    }
  }

  void updateDestinationLocation() {
    for (var element in state.locations) {
      if (element.locationType == LocationType.destination) {}
    }
  }
}

///   Widget buildScaffoldBody() => Scaffold(
