import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:package/package.dart';
import 'body/bg_images.dart';
import 'body/bottom_options.dart';
import 'body/onboarding_images.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      backgroundColor: kWhite,
      body: Stack(
        children: [OnboardingImages(), BgImg(), BgImg1()],
      ),
      bottomSheet: BottomOptions(),
    );
  }
}
