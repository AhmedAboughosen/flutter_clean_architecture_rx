// import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture_rx/core/domain/blocs/createAppPin/create_app_pin_bloc.dart';
// import 'package:flutter_clean_architecture_rx/core/domain/blocs/login/login_bloc.dart';
//
// import '../../../shared/components/bloc_provider.dart';
//
// class ConfirmPasswordInput extends StatelessWidget {
//   const ConfirmPasswordInput({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => StreamBuilder(
//         stream: (BlocProvider.of<CreateAppPinBloc>(context)).createAppPinValidation.confirmPassword.stream,
//         builder: (context, snap) {
//           return TextField(
//             keyboardType: TextInputType.number,
//             onChanged:
//             (BlocProvider.of<CreateAppPinBloc>(context)).createAppPinValidation.confirmPassword.valueChange,
//             decoration: InputDecoration(
//                 labelText: "Confirm Pin",
//                 hintText: "*****",
//                 errorText: snap.hasError ? "${snap.error}" : null),
//           );
//         },
//       );
// }
