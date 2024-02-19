import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:package/package.dart';

import '../../../../utils/constant/global_variables.dart';
import '../../../domain/entity/export.dart';
import '../../../domain/failure/export.dart';
import '../../../domain/repository/export.dart';
import '../../../domain/store/export.dart';

class RemoteLocationRepository implements LocationRepository {
  final UserLocationStore _userLocationStore;

  RemoteLocationRepository(this._userLocationStore);

  // Future determinePosition() async {
  //   LocationPermission permission;
  //
  //   if (!await isLocationServiceEnabled()) {
  //     'Location services are not enabled don\'t continue'.log;
  //
  //     ///TODO: request user to enable the location services.
  //     requestPermissions();
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await requestPermissions();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  // }

  @override
  Future<Either<LocationRepositoryFailure, Position>>
      getCurrentLocation() async {
    try {
      var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      var myLoc = UserLocation(
        id: uid.v1(),
        lat: location.latitude,
        lng: location.longitude,
        locationType: LocationType.current,
      );
      _userLocationStore.setLocation(myLoc);
      'Device current Location $location'.log;
      return right(location);
    } on TimeoutException catch (e) {
      'GetLocation Timeout Exception: $e'.log;
      throw left(Exception('Unable to get device location'));
    } on LocationServiceDisabledException catch (e) {
      'GetLocation Location service disable Exception: $e'.log;
      throw left(
        Exception('Device location service is disable.Please enable first'),
      );
    }
  }

  @override
  Future<Either<LocationRepositoryFailure, Position>>
      getPreviousLocation() async {
    try {
      Position? result = await Geolocator.getLastKnownPosition();
      'Device Previous Location $result'.log;
      if (result != null) return right(result);
      return left(LocationRepositoryFailure(error: 'No Previous location'));
    } catch (e) {
      throw left(
        LocationRepositoryFailure(error: 'Unable to get previous location'),
      );
    }
  }

    getPositionStream() =>
      Geolocator.getPositionStream(locationSettings: locationSettings).listen((event) {
         _userLocationStore.updateCurrentLocation(event);

      },);

  Future<LocationAccuracyStatus> getLocationAccuracy() async {
    return await Geolocator.getLocationAccuracy();
  }

  @override
  Future<Either<LocationRepositoryFailure, bool>>
      isLocationServiceEnabled() async {
    try {
      bool result = await Geolocator.isLocationServiceEnabled();
      if (result) return right(result);
      return left(
        LocationRepositoryFailure(error: 'Device location service is disable'),
      );
    } catch (e) {
      return left(
        LocationRepositoryFailure(
            error: 'unable to determine device location service'),
      );
    }
  }

  @override
  Future<Either<LocationRepositoryFailure, bool>> requestPermission() async {
    try {
      LocationPermission result = await Geolocator.requestPermission();
      switch (result) {
        case LocationPermission.denied:
        case LocationPermission.deniedForever:
        case LocationPermission.unableToDetermine:
          return right(false);
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return right(true);
      }
    } catch (e) {
      return left(
        LocationRepositoryFailure(error: 'Your location Permission is decline'),
      );
    }
  }

  @override
  Future<Either<LocationRepositoryFailure, bool>>
      openLocationSettingInDevice() async {
    try {
      bool result = await Geolocator.openLocationSettings();
      if (result) return right(result);
      return left(LocationRepositoryFailure(error: 'Can\'t open setting app'));
    } catch (e) {
      throw left(LocationRepositoryFailure(error: "Can't open setting app $e"));
    }
  }

  @override
  Future<Either<LocationRepositoryFailure, bool>> openSettingInDevice() async {
    try {
      bool result = await Geolocator.openAppSettings();
      if (result) return right(result);
      return left(LocationRepositoryFailure(error: 'Can\'t open setting app'));
    } catch (e) {
      throw left(LocationRepositoryFailure(error: "Can't open setting app $e"));
    }
  }

  static LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    timeLimit: twoSecond,
    distanceFilter: 100,
  );
}
