import 'package:geolocator/geolocator.dart';
import 'package:package/package.dart';

import '../../entity/map/searches/google_text_search_model.dart';
import '../../entity/map/searches/place_auto_complete_response.dart';
import '../../entity/map/routes/request_poly_lines.dart';
import '../../failure/map_repository_failure.dart';

enum TravelMode { driving, walking, bicycling, transit }

enum TransitTravelMode {
  transit,
  BUS,
  SUBWAY,
  TRAIN,
  LIGHT_RAIL,
  RAIL
}

abstract class MapRepository {
  /// Route apis
  /// find the ideal route from A to Z, calculates ETAs and distances
  /// for matrices of origin and destination locations.
  Future<Either<MapRepositoryFailure, RouteDirectionModel>> requestPolyLines();

  Future<Either<MapRepositoryFailure, GoogleTextSearchModel>> googleTextSearch(
      String query);

  Future<Either<MapRepositoryFailure, PlaceAutoCompleteResponseModel>>
      placeAutoCompleteSearch(String query);

  Future<String> getAddressFromGeographyCoordinates(Position position);

  Future<Either<MapRepositoryFailure, RouteDirectionModel>> getRouteDirections(
      String destination, String origin, TravelMode mode);
}
