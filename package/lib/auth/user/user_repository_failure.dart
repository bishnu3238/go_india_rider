
class UserRepositoryFailure implements Exception {
  final String error;
  UserRepositoryFailure([this.error = "User Repository Failure"]);

  @override
  String toString() => 'Failure{error: $error}';
}