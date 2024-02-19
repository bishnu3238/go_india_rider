import 'package:go_india_rider/core/domain/store/export.dart';

import '../../../core/domain/repository/export.dart';
import '../../../utils/constant/global_variables.dart';
import 'place_search_state.dart';
import 'package:package/package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/data/repository/export.dart';
import '../../../core/domain/entity/export.dart';

class PlaceSearchCubit extends Cubit<PlaceSearchState> {
  final Notifier _notifier;
  final UserLocationStore userLocationStore;
  final LocationRepository locationRepository;
  final GoogleMapRepository googleMapRepository;
  final MapControllerRepository mapControllerRepository;

  /// pickup and destination controllers

  PlaceSearchCubit(
    this._notifier, {
    required this.userLocationStore,
    required this.locationRepository,
    required this.googleMapRepository,
    required this.mapControllerRepository,
  }) : super(PlaceSearchState.init) {
    init();
  }

  init() {
    locationRepository.getCurrentLocation().then((value) => value.fold(
          (l) => _notifier.infoMessage(context: context, message: l.error),
          (r) {
            var location = UserLocation(lat: r.latitude, lng: r.longitude, id: uid.v1());
            emit(state.copyWith(
              pickupLocation: location,
              pickupValue: 'CURRENT LOCATION',
            ));
          },
        ));
  }

  late BuildContext context;

  Future<void> placeAutoSearch(String query) async {
    await googleMapRepository.googleTextSearch(query).then((value) {
      value.fold((l) => _notifier.errorMessage(context: context, message: l.error),
          (r) => emit(state.copyWith(predictions: r.resultModel)));
    });
  }

  @override
  Future<void> close() async {
    super.close();
    state.pickupController.dispose();
    state.destinationController.dispose();
  }

  void updatePickupLocation(TextSearchResultModel pre) {
    if (state.placeSearchType == PlaceSearchType.pickup) {
      var pickup = state.pickupLocation.copyWith(
        lat: pre.latLng.latitude,
        lng: pre.latLng.longitude,
      );
      userLocationStore.setPickUpLocation(pickup);

      emit(state.copyWith(
        pickupValue: pre.address,
        pickupLocation: pickup,
        predictions: [],
      ));
    } else if (state.placeSearchType == PlaceSearchType.destination) {
      var destination = state.destinationLocation.copyWith(
        lat: pre.latLng.latitude,
        lng: pre.latLng.longitude,
      );
      userLocationStore.setDestinationLocation(destination);
      emit(state.copyWith(
        destinationValue: pre.address,
        destinationLocation: destination,
        predictions: [],
      ));
    } else if (state.placeSearchType == PlaceSearchType.breakJourney) {
      List<UserLocation> breakLocation = [
        ...state.breakLocation,
        UserLocation(lat: pre.latLng.latitude, lng: pre.latLng.longitude, id: '')
      ];

      emit(state.copyWith(
        pickupValue: pre.address,
        breakLocation: breakLocation,
        predictions: [],
      ));
    }
  }

  void searchType(PlaceSearchType searchType) {
    emit(state.copyWith(placeSearchType: searchType));
  }

  void myCurrentLocation() async {
    await locationRepository.getCurrentLocation().then((value) => value.fold(
          (l) => _notifier.infoMessage(context: context, message: l.error),
          (r) {
            var location = UserLocation(lat: r.latitude, lng: r.longitude, id: '');
            emit(state.copyWith(
                pickupLocation: location, pickupValue: 'Current Location'));
          },
        ));
  }

  removeFieldValue() {
    if (state.placeSearchType == PlaceSearchType.pickup) {
      state.pickupController.clear();
      emit(state.copyWith(pickupValue: '', pickupLocation: UserLocation.empty));
    } else if (state.placeSearchType == PlaceSearchType.destination) {
      state.destinationController.clear();
      emit(state.copyWith(
        destinationValue: '',
        destinationLocation: UserLocation.empty,
      ));
    }
  }
}
