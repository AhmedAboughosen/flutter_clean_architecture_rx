// import 'package:fluent_validation/fluent_validation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture_rx/core/domain/blocs/createAppPin/create_app_pin_bloc.dart';
// import 'package:flutter_clean_architecture_rx/core/domain/blocs/login/login_bloc.dart';
// import 'package:flutter_clean_architecture_rx/presentation/features/login/components/submit_button.dart';
// import 'package:flutter_clean_architecture_rx/presentation/shared/components/bloc_provider.dart';
//
// import '../components/confirm_password_input.dart';
// import '../components/password_input.dart';
//
// class CreateAppPinPage extends StatelessWidget {
//   const CreateAppPinPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocProvider<CreateAppPinBloc>(
//       create: getIt<CreateAppPinBloc>(),
//       child: Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: const [
//               SizedBox(
//                 height: 30,
//               ),
//               PasswordInput(
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               ConfirmPasswordInput(),
//               SizedBox(
//                 height: 30,
//               ),
//               SubmitButton()
//             ],
//           )
//       ),
//     );
//   }
//
// }
//
