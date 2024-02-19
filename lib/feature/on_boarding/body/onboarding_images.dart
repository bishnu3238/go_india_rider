import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/onboarding_cubit.dart';
import 'package:package/package.dart';
import '../core/onboarding_info.dart';
import '../core/onboarding_state.dart';

class OnboardingImages extends StatefulWidget {
  const OnboardingImages({super.key});

  @override
  State<OnboardingImages> createState() => _OnboardingImagesState();
}

class _OnboardingImagesState extends State<OnboardingImages> {
  late OnboardingCubit cubit;
  late Timer _timer;

  @override
  void initState() {
    cubit = context.read<OnboardingCubit>();
    _timer = Timer.periodic(thrSecond + oneSecond, (Timer timer) {
      if (cubit.state.selectedIndex < onboardingItems.length - 1) {
        'hello'.log;
        cubit.state.selectedIndex++;
      }
      cubit.state.pageController.animateToPage(
        cubit.state.selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: context.read<OnboardingCubit>().onPageChange,
          itemCount: onboardingItems.length,
          controller: state.pageController,
          itemBuilder: (context, index) {
            return Image.asset(
              onboardingItems[index].image,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              colorBlendMode: BlendMode.colorDodge,
              height: height,
              color: Theme.of(context).colorScheme.background,
            );
          },
        );
      },
    );
  }
}
