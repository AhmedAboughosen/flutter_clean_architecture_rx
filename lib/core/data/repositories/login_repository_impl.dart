import 'package:flutter_clean_architecture_rx/infrastructure/remoteDataSource/httpClient/remote_data_source_service.dart';

import '../../../infrastructure/remoteDataSource/networkSettings/http_method.dart';
import '../models/auth/login_model.dart';
import 'base_repository.dart';

class LoginRepository extends BaseRepository {
  LoginRepository({RemoteDataSourceService? remoteDataSourceService});

  @override
  String endPoint() => 'api/Profile/Pin';

  Stream<LoginModel> login(String userName, String password) =>
      remoteDataSourceService!.requestService<LoginModel>(
        () => LoginModel(),
        endPoint: endPoint(),
        queryParameters: {
          'userName': userName,
          'password': password,
        },
        requestMethod: HTTPMethod.POST,
      );
}
