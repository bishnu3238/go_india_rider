import '../../../../core/domain/entity/export.dart';

class PlaceSearchMapInitialParams {
  UserLocation pickupLocation;
  UserLocation destinationLocation;
  List<UserLocation> breakJourneyLocation;

  PlaceSearchMapInitialParams({
    required this.pickupLocation,
    required this.destinationLocation,
    this.breakJourneyLocation = const [],
  });
}
