import 'package:flutter/material.dart';

class OnboardingState {
  bool isLastPage;
  int selectedIndex;
  final PageController pageController;

  OnboardingState({
    required this.isLastPage,
    required this.selectedIndex,
    required this.pageController,
  });

  @override
  String toString() {
    return 'OnboardingState{ isLastPage: $isLastPage, selectedIndex: $selectedIndex,}';
  }

  OnboardingState copyWith({
    bool? isLastPage,
    int? selectedIndex,
  }) {
    return OnboardingState(
      isLastPage: isLastPage ?? this.isLastPage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      pageController: pageController,
    );
  }

  static OnboardingState init(PageController controller) => OnboardingState(
        isLastPage: false,
        selectedIndex: 0,
        pageController: controller,
      );
}
