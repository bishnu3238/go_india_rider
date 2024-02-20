import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constant/constant.dart';

class Api {
  static const String getPlaceApi = "";

  static const String findPlaceApi =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/output?parameters";

  static Uri googleAddressFromGeographyCoordinates(LatLng latLng) => Uri.https(
        "maps.googleapis.com",
        "/maps/api/geocode/json",
        {'latlng': '${latLng.latitude},${latLng.longitude}', 'key': googleApiKey},
      );

  static Uri googlePlaceAutoCompleteApi(String query) => Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {
          'input': query,
          'key': googleApiKey,
          'components': 'country:IN',
        },
      );

  static Uri googleTextSearchApi(String query) => Uri.https(
        'maps.googleapis.com',
        'maps/api/place/textsearch/json',
        {'query': query, 'components': 'country:IN', 'key': googleApiKey},
      );

  static Uri googleGetAddressFromPlaceId(String placeID) => Uri.https(
        'maps.googleapis.com',
        'maps/api/geocode/json',
        {'place_id': placeID},
      );

  static Uri getRouteDirectionApi(String destination, String origin, String mode) =>
      Uri.https(
        'maps.googleapis.com',
        'maps/api/directions/json',
        {'destination': destination, 'origin': origin, 'mode': mode, 'key': googleApiKey},
      );

  static Uri getAddressFromPlaceIdApi(String placeId) => Uri.https(
        'maps.googleapis.com',
        'maps/api/geocode',
        {'place_id': placeId, 'key': googleApiKey},
      );
}
