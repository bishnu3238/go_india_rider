import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/repository/export.dart';

class GoogleMapControllerRepository implements MapControllerRepository {

  @override
  Completer<GoogleMapController> controller =Completer<GoogleMapController>();
  @override
  void dispose() => controller.future.then((value) => value.dispose());

  @override
  void fitBound(List<LatLng> points) {
    // TODO: implement fitBound
  }

  @override
  Future<LatLng> goToCenter() {
    // TODO: implement goToCenter
    throw UnimplementedError();
  }

  @override
  void moveCamera(LatLng location, [double? zoom = 14]) async {
    (await controller.future).animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: location, zoom: zoom!)),
    );
  }

}
