
import '../../../../../core/domain/entity/user/user_entity.dart';

class SettingState {
  final bool showLoading;

  final UserEntity user;

  static SettingState init(UserEntity user) =>SettingState(showLoading: false, user: user);

  const SettingState( {required this.showLoading, required this.user});


  @override
  String toString() {
    return 'SettingState{showLoading: $showLoading, user: $user}';
  }

  SettingState copyWith({
    bool? showLoading,
    UserEntity? user,
  }) {
    return SettingState(
      showLoading: showLoading ?? this.showLoading, user:user?? this.user,
    );
  }

}
