import 'package:dartz/dartz.dart';

import 'user_repository_failure.dart';

abstract class UserRepository<T> {
  T get user;
  Future<Either<UserRepositoryFailure, T>> authenticate();
  Future<Either<UserRepositoryFailure, T>> getUser(String id);
  Future<Either<UserRepositoryFailure, T>> newUser(Map<String, String> data);
  Future<Either<UserRepositoryFailure, T>> updateUser(String url, Map<String, String> data);
  Future<Either<UserRepositoryFailure, R>> updateProfileImage<R>(String url, Map<String, String> data);
  Future<Either<UserRepositoryFailure, bool>> getUserAddresses(String url);

}














