import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:package/package.dart';

import '../../../data/model/export.dart';
import '../../entity/export.dart';

class UserStore extends HydratedCubit<UserEntity> {
  UserStore() : super(UserEntity.empty);

  void setUser(UserEntity user) => emit(user);
  bool get isEmpty => state.id == '0';

  @override
  UserEntity? fromJson(Map<String, dynamic> json) {
    'Local User Data => $json'.log;
    var user = UserJson.fromLocal(json).toDomain();
    return json['id'] == '0' ? UserEntity.empty : user;
  }

  @override
  Map<String, dynamic>? toJson(UserEntity state) => state.toMap();
}
