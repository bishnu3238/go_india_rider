import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../utils/constant/global_variables.dart';
 import 'body/otp_body.dart';
import 'core/cubit.dart';
import 'core/initial_params.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.params});
  final OtpInitialParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (ctx) => getIt<OtpCubit>(param1: params)..context =context,
        child: const OtpBody(),
      ),
    );
  }
}
