import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:package/package.dart';
import '../../../core/domain/store/export.dart';
import 'home_initial_params.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Notifier notifier;
  final UserStore _userStore;
  HomeCubit(
    this._userStore, {
    required HomeInitialParams params,
    required this.notifier,
  }) : super(HomeState(params: params));

  Future init() async {
    try {
      await Future.wait([]).then((value) {});
    } catch (e) {
      'Home Provider inti $e'.log;
    }
  }

  void nextBranch(int index) {
    state.params.navigationShell?.goBranch(
      index,
      initialLocation:
          state.currentIndex == state.params.navigationShell?.currentIndex,
    );
    emit(state.copyWith(currentIndex: index));
  }
}
