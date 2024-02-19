import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package/package.dart';
import '../../../core/domain/entity/export.dart';
import '../../../utils/constant/global_variables.dart';
 import '../../../utils/widgets/icons/back_icon.dart';
import 'body/login_form.dart';
import 'core/login_cubit.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackIcon()),
      body: BlocProvider(
        create: (ctx) => LoginCubit(
          authRepository: getIt<AuthRepository<UserEntity>>(),
          notifier: getIt<Notifier>(),
        )..context = context,
        child: const SafeArea(
          child: SingleChildScrollView(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
