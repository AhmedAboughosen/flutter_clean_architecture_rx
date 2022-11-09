import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_rx/core/domain/blocs/login/login_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: context.read<LoginBloc>().loginValidation.email.stream,
        builder: (context, snap) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged:
                context.read<LoginBloc>().loginValidation.email.valueChange,
            decoration: InputDecoration(
                labelText: "Email address",
                hintText: "you@example.com",
                errorText: snap.hasError ? "${snap.error}" : null),
          );
        },
      );
}
