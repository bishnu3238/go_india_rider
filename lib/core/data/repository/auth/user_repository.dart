 import 'package:package/auth/user/user_repository_failure.dart';
import 'package:package/package.dart';

import '../../../domain/entity/export.dart';
import '../../../domain/store/export.dart';
import '../../model/export.dart';

class RemoteUserRepository implements UserRepository<UserEntity> {
  RemoteUserRepository({required this.userStore,
    required this.networkService,
  });

  final UserStore userStore;
   final NetworkService networkService;

  @override
  Future<Either<UserRepositoryFailure, UserEntity>> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRepositoryFailure, UserEntity>> newUser(
      Map<String, String> data) {
    // TODO: implement newUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRepositoryFailure, UserEntity>> updateUser(
      String url, Map<String, String> data) async {
    return await networkService.post(url, data).then((value) => value.fold(
          (l) => left(UserRepositoryFailure(l.error)),
          (r) {
        UserEntity user = UserJson.fromMap(r['data']).toDomain();
        userStore.setUser(user);

        return right(user);
      },
    ));
  }

  @override
  // TODO: implement user
  UserEntity get user => throw UnimplementedError();

  @override
  Future<Either<UserRepositoryFailure, UserEntity>> authenticate() async {
    // TODO: implement newUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UserRepositoryFailure, R>> updateProfileImage<R>(
      String url,
      Map<String, String> data,
      ) async {
    return await networkService.post(url, data).then((value) => value.fold(
          (l) => left(UserRepositoryFailure(l.error)),
          (r) => right(r),
    ));
  }

  @override
  Future<Either<UserRepositoryFailure, bool>> getUserAddresses(
      String url) async {
    // TODO: implement newUser
    throw UnimplementedError();
  }
}
