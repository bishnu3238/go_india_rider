import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../core/domain/entity/export.dart';

enum PlaceSearchType { pickup, destination, breakJourney }

class PlaceSearchState extends Equatable {
  final bool isDone;
  final UserLocation pickupLocation, destinationLocation;
  final List<UserLocation> breakLocation;

  final TextEditingController pickupController;
  final TextEditingController destinationController;

  final PlaceSearchType placeSearchType;
  // final PlaceSearchType isSearchPickup, isSearchDestination, isSearchBreak;

  final List<TextSearchResultModel> predictions;

  const PlaceSearchState({
    this.isDone = false,
    required this.pickupLocation,
    required this.destinationLocation,
    required this.predictions,
    this.breakLocation = const [],
    required this.pickupController,
    required this.destinationController,
    required this.placeSearchType,
    // this.isSearchPickup = false,
    // this.isSearchDestination = false,
    // this.isSearchBreak = false,
  });

  static PlaceSearchState init = PlaceSearchState(
    pickupLocation: UserLocation.empty,
    destinationLocation: UserLocation.empty,
    breakLocation: const [],
    predictions: const [],
    pickupController: TextEditingController(),
    destinationController: TextEditingController(),
    placeSearchType: PlaceSearchType.pickup,
    // isSearchBreak: false,
    // isSearchDestination: false,
    // isSearchPickup: false,
  );

  get noSuggestions => predictions.isEmpty;

  @override
  String toString() {
    return 'PlaceSearchState{isDone: $isDone, pickupLocation: $pickupLocation, destinationLocation: $destinationLocation, breakLocation: $breakLocation, pickupController: $pickupController, destinationController: $destinationController, placeSearchType: $placeSearchType, predictions: $predictions}';
  }

  PlaceSearchState copyWith({
    bool? isDone,
    UserLocation? pickupLocation,
    UserLocation? destinationLocation,
    List<UserLocation>? breakLocation,
    List<TextSearchResultModel>? predictions,
    String? pickupValue,
    String? destinationValue,
    PlaceSearchType? placeSearchType,
    bool? isSearchDestination,
    bool? isSearchPickup,
  }) {
    return PlaceSearchState(
      isDone: isDone ?? this.isDone,
      predictions: predictions ?? this.predictions,
      breakLocation: breakLocation ?? this.breakLocation,
      placeSearchType: placeSearchType ?? this.placeSearchType,
      // isSearchBreak: isSearchBreak ?? this.isSearchBreak,
      // isSearchPickup: isSearchPickup ?? this.isSearchPickup,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      // isSearchDestination: isSearchDestination ?? this.isSearchDestination,
      pickupController: pickupValue == null
          ? pickupController
          : TextEditingController(text: pickupValue),
      destinationController: destinationValue == null
          ? destinationController
          : TextEditingController(text: destinationValue),
    );
  }

  @override
  List<Object?> get props => [
        isDone,
        pickupLocation,
        destinationLocation,
        predictions,
        breakLocation,
        pickupController,
        destinationController,
        placeSearchType,
      ];
}
