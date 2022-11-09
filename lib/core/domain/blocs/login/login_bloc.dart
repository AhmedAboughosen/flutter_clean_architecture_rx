import 'package:flutter_clean_architecture_rx/core/data/models/base/resource.dart';
import 'package:flutter_clean_architecture_rx/core/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_architecture_rx/core/domain/validation/login_validation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/auth/login_model.dart';
import '../../base/bloc_base.dart';
import '../../base/sync_stream.dart';

@Injectable()
class LoginBloc extends BlocBase {
  final LoginValidation loginValidation;
  final LoginRepository loginRepository;

  final SyncStream<LoginModel> loginApi;

  LoginBloc({
    required this.loginValidation,
    required this.loginRepository,
    required this.loginApi,
  });

  void login() {
    if (!loginValidation.validate()) return;

    loginApi
        .push(loginRepository.login(
            loginValidation.email.value, loginValidation.password.value));
  }

  @override
  void dispose() {
    loginApi.close();
  }
}


// import 'package:formz/formz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:payment_core/data/app_config.dart';
// import 'package:payment_core/data/repositories/localDbRepository/local_db_repository.dart';
// import 'package:payment_core/domain/validation/merchant_pin.dart';
//
// import '../../../data/repositories/changePin/change_pin_repository.dart';
// import '../../../infrastructure/exceptions/core_exception.dart';
// import '../../../infrastructure/exceptions/network_exception.dart';
// import '../../validation/equality.dart';
// import '../base_cubit.dart';
// import 'change_pin_state.dart';
//
// @Injectable()
// class ChangePinBloc extends BaseCubit<ChangePinState> {
//   final ChangePinRepository changePinRepository;
//   final LocalDbRepository localDbRepository;
//
//   ChangePinBloc(this.changePinRepository, this.localDbRepository)
//       : super(const ChangePinState());
//
//   /// updates the status of form beside on input valid or not.
//   void oldPinChange(String value) {
//     final oldPin =
//         EqualityValidation.dirty(value: value, password: AppConfig.password);
//     emit(state.copyWith(
//       oldPin: oldPin,
//       status: Formz.validate([oldPin, state.newPin, state.confirmPin]),
//     ));
//   }
//
//   /// updates the status of form beside on input valid or not.
//   void newPinChange(String value) {
//     final pin = MerchantPinValidation.dirty(value);
//     final confirmPin = EqualityValidation.dirty(
//         value: state.confirmPin.value, password: pin.value);
//     emit(state.copyWith(
//       newPin: pin,
//       confirmPin: confirmPin,
//       status: Formz.validate([pin, state.oldPin, confirmPin]),
//     ));
//   }
//
//   /// updates the status of form beside on input valid or not.
//   void confirmPinChange(String value) {
//     final confirmPin =
//         EqualityValidation.dirty(value: value, password: state.newPin.value);
//     emit(state.copyWith(
//       confirmPin: confirmPin,
//       status: Formz.validate([confirmPin, state.oldPin, state.newPin]),
//     ));
//   }
//
//   /// changePin Repository run.
//   void changePin() async {
//     if (!state.status.isValidated) {
//       emit(state.copyWith(status: FormzStatus.invalid));
//       return;
//     }
//
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));
//
//     try {
//       await changePinRepository.changePin(state.newPin.value);
//
//       emit(state.copyWith(status: FormzStatus.submissionSuccess));
//     } on CoreException catch (e) {
//       emit(state.copyWith(
//           status: FormzStatus.submissionFailure, message: e.message));
//     } on NetworkException catch (e) {
//       emit(state.copyWith(
//           status: FormzStatus.submissionFailure, message: e.message));
//     }
//   }
// }
