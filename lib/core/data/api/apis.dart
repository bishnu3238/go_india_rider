import 'package:geolocator/geolocator.dart';
 import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constant/constant.dart';


class Api {
  static const String getPlaceApi = "";

  static const String findPlaceApi =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/output?parameters";

  static Uri googleAddressFromGeographyCoordinates(Position position) => Uri.https(
        "maps.googleapis.com",
        "/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleMapApiKey",
      );

  static Uri googlePlaceAutoCompleteApi(String query, LatLng latlng) => Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {
          'input': query,
          'key': googleApiKey,
          'location': '${latlng.latitude},${latlng.longitude}',
          'radius': '100000',
        },
      );

  static Uri googleTextSearchApi(String query) => Uri.https(
        'maps.googleapis.com',
        'maps/api/place/textsearch/json',
        {'query': query, 'key': googleApiKey},
      );

  static Uri googleGetAddressFromPlaceId(String placeID) => Uri.https(
        'maps.googleapis.com',
        'maps/api/geocode/json',
        {'place_id': placeID},
      );
  // https://maps.googleapis.com/maps/api/directions/json
  // ?destination=Madrid
  // &origin=Toledo
  // &region=es
  // &key=YOUR_API_KEY
  static Uri getRouteDirectionApi(String destination,String  origin,String mode) =>
      Uri.https(
        'maps.googleapis.com',
        'maps/api/directions/json',
        {'destination': destination, 'origin': origin, 'mode': mode, 'key': googleApiKey},
      );
}
