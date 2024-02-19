
 import 'package:package/package.dart';
import '../../data/model/user/user_json.dart';
import '../entity/user/user_entity.dart';
import '../store/export.dart';

class UpdateProfileImageUseCase {
  final UserRepository _usersRepository;
   final UserStore _userStore;
  final NetworkService _networkService;

  UpdateProfileImageUseCase(
    this._usersRepository,
     this._userStore,
    this._networkService,
  );

  Future<Either<UpdateProfileImageFailure, bool>> execute(
    List<XFile?> files,
  ) async {
    if (!files.iterator.moveNext()) {
      return left(UpdateProfileImageFailure(error: 'image is not picked!'));
    }

    var image = await StaticMethods.convertImageAsBase64(files[0]!);
    Map<String, String> data = {'id': _userStore.state.id, 'image_data': image};

    return _networkService.post('updateProfileImageApi', data).then(
          (value) => value.fold(
            (l) {
              return left(UpdateProfileImageFailure(error: l.toString()));
            },
            (r) {
              "UpdateProfileUseCase: execute => ${r.toString()}".log;
              UserEntity user = UserJson.fromMap(r['data']).toDomain();
              _userStore.setUser(user);
              return right(true);
            },
          ),
        );
  }
}

class UpdateProfileImageFailure implements Exception {
  final String err;
  UpdateProfileImageFailure({String? error})
      : err = ' UpdateProfileImageFailure: error $error';
}
