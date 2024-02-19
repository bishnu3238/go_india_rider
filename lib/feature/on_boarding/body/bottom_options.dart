import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../route/route_name.dart';
import '../core/onboarding_cubit.dart';
import '../core/onboarding_info.dart';
import '../core/onboarding_state.dart';

class BottomOptions extends StatelessWidget {
  const BottomOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Container(
          color: kWhite,
          child: state.isLastPage ? const GetStarted() : const GoNext(),
        );
      },
    );
  }
}

class GoNext extends StatelessWidget {
  const GoNext({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: Text("Skip", style: StyleX.plus(context).copyWith(color: kDark)),
            onPressed: () => context.goNamed(RouteName.login.name),
          ),
          Row(
            children: List.generate(
              onboardingItems.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: p16 / 4),
                  child: DotIndicator(
                    isActive: index == state.selectedIndex,
                    activeColor: kDarkDeep,
                    inActiveColor: kGrey,
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () => state.pageController.nextPage(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
            ),
            child: Text("Next", style: StyleX.plus(context).copyWith(color: kDark)),
          ),
        ],
      );
    });
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kDarkDeep,
          fixedSize: Size(getHorizontalSize(500), getVerticalSize(50)),
          shape: roundZero,
        ),
        onPressed: () => context.goNamed(RouteName.login.name),
        child: Text(
          "Get started",
          style: StyleX.shadow(context).copyWith(
            fontFamily: familyUrbanist,
            package: 'package',
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
