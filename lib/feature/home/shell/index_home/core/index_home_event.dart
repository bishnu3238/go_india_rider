import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class IndexHomeEvent {}

class IndexHomeUpdateLocationEvent extends IndexHomeEvent{}


class IndexHomeMapTypeChangeEvent extends IndexHomeEvent {
  final MapType type;
  IndexHomeMapTypeChangeEvent({required this.type});
}
