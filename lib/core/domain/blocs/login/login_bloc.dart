import 'package:flutter_clean_architecture_rx/core/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_architecture_rx/core/domain/validation/login_validation.dart';
import 'package:form_bloc_version/src/bloc_base.dart';
import 'package:form_bloc_version/src/sync_stream.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/auth/login_model.dart';

@Injectable()
class LoginBloc extends BlocBase {
  final LoginValidation loginValidation;
  final LoginRepository loginRepository;

  final SyncStream<LoginModel> loginApi = SyncStream();

  LoginBloc({
    required this.loginValidation,
    required this.loginRepository,
    // required this.loginApi,
  });

  void login() {
    // if (!loginValidation.validate()) return;

    loginApi.push(loginRepository.login(
        "loginValidation.email.value", "loginValidation.password.value"));
  }

  @override
  void dispose() {}
}
