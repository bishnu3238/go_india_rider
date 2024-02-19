

class MapRepositoryFailure implements Exception{


  final String error;


  MapRepositoryFailure({this.error = 'Google map error'});

  @override
  String toString() => 'GoogleMapRepositoryFailure{error: $error}';
}