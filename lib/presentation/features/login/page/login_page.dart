import 'package:fluent_validation/fluent_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_rx/core/domain/blocs/login/login_bloc.dart';
import 'package:flutter_clean_architecture_rx/presentation/features/login/components/email_input.dart';
import 'package:flutter_clean_architecture_rx/presentation/features/login/components/password_input.dart';
import 'package:flutter_clean_architecture_rx/presentation/features/login/components/submit_button.dart';
import 'package:flutter_clean_architecture_rx/presentation/shared/components/bloc_provider.dart';

import '../../../../core/domain/di/injection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<LoginBloc>(
        create: getIt<LoginBloc>(),
        child: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            EmailInput(),
            SizedBox(
              height: 30,
            ),
            PasswordInput(),
            SizedBox(
              height: 30,
            ),
            SubmitButton()
          ],
        ),
      ),
    );
  }
}
