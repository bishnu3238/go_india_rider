import 'package:geolocator/geolocator.dart';
import 'package:package/package.dart';

import '../../failure/export.dart';

abstract class LocationRepository {


  ///
  Future<Either<LocationRepositoryFailure, bool>> openSettingInDevice();
  Future<Either<LocationRepositoryFailure, bool>> openLocationSettingInDevice();

  ///
  Future<Either<LocationRepositoryFailure, Position>> getCurrentLocation();
  Future<Either<LocationRepositoryFailure, Position>> getPreviousLocation();

  ///
  Future<Either<LocationRepositoryFailure, bool>> requestPermission();
  Future<Either<LocationRepositoryFailure, bool>> isLocationServiceEnabled();
}
