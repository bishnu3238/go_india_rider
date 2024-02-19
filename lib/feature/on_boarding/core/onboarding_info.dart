

import '../../../core/constant/image.dart';

class OnboardingInfo {
  final String title;
  final String descriptions;
  final String image;

  OnboardingInfo(
      {required this.title, required this.descriptions, required this.image});
}

List<OnboardingInfo> onboardingItems = [
  OnboardingInfo(
      title: 'title', descriptions: 'descriptions', image: ImgCon.onboarding2),
  OnboardingInfo(
      title: 'title', descriptions: 'descriptions', image: ImgCon.onboarding8),
  OnboardingInfo(
      title: 'title', descriptions: 'descriptions', image: ImgCon.onboarding11),
  OnboardingInfo(
      title: 'title', descriptions: 'descriptions', image: ImgCon.onboarding1),
  OnboardingInfo(
      title: 'title', descriptions: 'descriptions', image: ImgCon.onboarding6),
];
