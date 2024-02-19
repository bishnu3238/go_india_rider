import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package/package.dart';

import 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroState.init());

  Future init() async {
    await Future.delayed(oneSecond,
        () => emit(state.copyWith(isWaiting: false, isLoading: false)));
  }
}
