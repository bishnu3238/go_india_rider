import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package/package.dart';

import '../../../domain/entity/export.dart';
import '../../../domain/failure/map_repository_failure.dart';
import '../../../domain/repository/map/map_repository.dart';
import '../../../domain/store/user_location_store/user_location_store.dart';
import '../../api/apis.dart';

class GoogleMapRepository implements MapRepository {
  final NetworkService _networkService;
  final UserLocationStore userLocationStore;

  GoogleMapRepository(this._networkService, this.userLocationStore);

  @override
  Future<String> getPlaceId(String query) async {
    return await _networkService.get(Api.getPlaceApi).then((value) => value as String);
  }

  @override
  Future<Either<MapRepositoryFailure, dynamic>> getAddressFromGeographyCoordinates(
      LatLng latLng) async {
    return _networkService
        .get2(Api.googleAddressFromGeographyCoordinates(latLng))
        .then((value) => value.fold(
              (l) => left(MapRepositoryFailure(error: l.error)),
              (r) => right(r['results'][0]['formatted_address']),
            ));
  }

  @override
  Future<Either<MapRepositoryFailure, PlaceAutoCompleteResponseModel>>
      placeAutoCompleteSearch(String query) async {
    return _networkService
        .get2(Api.googlePlaceAutoCompleteApi(query))
        .then((value) => value.fold(
              (l) => left(MapRepositoryFailure(error: l.error)),
              (r) {
                var predictions = PlaceAutoCompleteResponseModel.fromMap(r);
                return right(predictions);
              },
            ));
  }

  @override
  Future<Either<MapRepositoryFailure, GoogleTextSearchModel>> googleTextSearch(
      String query) async {
    return await _networkService
        .get2(Api.googlePlaceAutoCompleteApi(query))
        .then((value) => value.fold(
              (l) => left(MapRepositoryFailure(error: l.error)),
              (r) {
                var predictions = GoogleTextSearchModel.fromMap(r);
                return right(predictions);
              },
            ));
  }

  @override
  Future<Either<MapRepositoryFailure, RouteDirectionModel>> requestPolyLines() {
    throw UnimplementedError();
  }

  @override
  Future<Either<MapRepositoryFailure, RouteDirectionModel>> getRouteDirections(
      String destination, origin, TravelMode mode) async {
    return await _networkService
        .get2(Api.getRouteDirectionApi(destination, origin, mode.name))
        .then(
            (value) => value.fold((l) => left(MapRepositoryFailure(error: l.error)), (r) {
                  return right(RouteDirectionModel.empty);
                }));
  }

  @override
  Future<Either<MapRepositoryFailure, dynamic>> getAddressFromPlaceId(
      String placeId) async {
    return await _networkService
        .get2(Api.getAddressFromPlaceIdApi(placeId))
        .then((value) => value.fold(
              (l) => left(MapRepositoryFailure(error: l.error)),
              (r) => right(unit),
            ));
  }
}
