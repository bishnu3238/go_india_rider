class LocationRepositoryFailure implements Exception {
  final String error;

  LocationRepositoryFailure({this.error = 'Location Service Error'});

  @override
  String toString() => 'LocationRepositoryFailure{error: $error}';
}
