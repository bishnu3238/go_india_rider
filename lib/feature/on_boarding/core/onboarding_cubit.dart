import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../core/domain/store/export.dart';
import 'onboarding_info.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.init(PageController()));

  void onPageChange(int value) {
    emit(state.copyWith(
      isLastPage: onboardingItems.length - 1 == value,
      selectedIndex: value,
    ));
  }

  @override
  Future<void> close() async {
    super.close();
    state.pageController.dispose();
  }


}
