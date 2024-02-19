import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package/package.dart';
import '../core/login_cubit.dart';
import '../core/login_state.dart';
import 'login_footer.dart';
import 'login_header.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    var provider = context.read<LoginCubit>();
    phoneController =
        TextEditingController(text: provider.state.phoneNumber.value)
          ..addListener(() => provider.phoneNoChanged(phoneController.text));

    provider.phoneNoHint().then((value) => phoneController.text = value ?? "");
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: LoginCubit.listener,
      builder: (ctx, state) => Form(
        child: Padding(
          padding: 16.pxHV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              const SizedBox(height: 30),
              _PhoneField(phoneController: phoneController, cubit: cubit),
              const SizedBox(height: 20),
              _Button(cubit: cubit),
              const SizedBox(height: 20),
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.cubit});

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 6,
      child: ButtonX(
        radius: radius10,
        elevation: 3,
        onTap: () => cubit.login(context),
        showLoading: cubit.state.status.isInProgress,
        label: 'Continue',
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({required this.phoneController, required this.cubit});

  final TextEditingController phoneController;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 5,
      child: PhoneField(
        showFlag: true,
        radius: 10,
        hint: 'Phone Number',
        fillColor: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        controller: phoneController,
        validator: cubit.phoneValidator,
      ),
    );
  }
}
