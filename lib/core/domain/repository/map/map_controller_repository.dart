


import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapControllerRepository{
  late Completer<GoogleMapController>  controller;

void fitBound(List<LatLng> points);
void moveCamera(LatLng location, double? zoom);
Future<LatLng> goToCenter();
void dispose();





}