// import 'package:flutter_clean_architecture_rx/core/data/repositories/login_repository_impl.dart';
// import 'package:flutter_clean_architecture_rx/core/domain/validation/login_validation.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../data/models/auth/login_model.dart';
// import '../../base/bloc_base.dart';
// import '../../validation/create_app_pin_validation.dart';
// import 'package:form_bloc_version/src/sync_stream.dart';
// @Injectable()
// class CreateAppPinBloc extends BlocBase {
//   final CreateAppPinValidation createAppPinValidation;
//
//   final SyncStream<LoginModel> loginApi = SyncStream();
//
//   CreateAppPinBloc({
//     required this.createAppPinValidation,
//     // required this.loginApi,
//   });
//
//   void create() {
//     // if (!loginValidation.validate()) return;
//     //
//     // loginApi
//     //     .push(loginRepository.login(
//     //         loginValidation.email.value, loginValidation.password.value));
//   }
//
//   @override
//   void dispose() {
//
//   }
// }
//
//
//
