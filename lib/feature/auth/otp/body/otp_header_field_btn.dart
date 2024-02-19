import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/feature/auth/otp/core/state.dart';
import 'package:package/package.dart';

import '../core/cubit.dart';

class OtpFieldAndBtn extends StatefulWidget {
  const OtpFieldAndBtn({super.key});

  @override
  State<OtpFieldAndBtn> createState() => _OtpFieldAndBtnState();
}

class _OtpFieldAndBtnState extends State<OtpFieldAndBtn> {
  late OtpCubit cubit;

  late TextEditingController otpController;
  @override
  void initState() {
    cubit = context.read<OtpCubit>();
    super.initState();
    otpController = TextEditingController(text: cubit.state.otp.value)
      ..addListener(() => cubit.otpChange(otpController.text));
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        child: Column(
          children: [
            FadeInAnimation(
              delay: 1.9,
              child: OtpFieldX(controller: otpController),
            ),
            const SizedBox(height: 30),
            FadeInAnimation(
              delay: 2.1,
              child: BlocBuilder<OtpCubit, OtpState>(
                builder: (context, state) {
                  return ButtonXX(
                    label: "Verify",
                    loading: state.status.isInProgress,

                    onPressed: () => cubit.verify(context),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpHeader extends StatelessWidget {
  const OtpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInAnimation(
            delay: 1.3,
            child: Text("OTP Verification", style: StyleX.urbanist(context)),
          ),
          FadeInAnimation(
            delay: 1.6,
            child: Text(
              "Enter the verification code we just sent on your phone no.",
              style: StyleX.urbanistSemiBold(context),
            ),
          )
        ],
      ),
    );
  }
}
