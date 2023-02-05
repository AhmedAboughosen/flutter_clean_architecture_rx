import 'package:flutter_clean_architecture_rx/infrastructure/remoteDataSource/httpClient/remote_data_source_service.dart';
import 'package:injectable/injectable.dart';

import '../../../infrastructure/remoteDataSource/networkSettings/http_method.dart';
import '../models/auth/login_model.dart';
import 'base_repository.dart';
import 'end_points.dart';

@Injectable()
class LoginRepository extends BaseRepository {
  LoginRepository({RemoteDataSourceService? remoteDataSourceService})
      : super(remoteDataSourceService: remoteDataSourceService);

  Stream<LoginModel> login(String userName, String password) =>
      remoteDataSourceService!.requestService<LoginModel>(
        () => LoginModel(),
        endPoint: EndPoints.TO_DO,
        requestMethod: HTTPMethod.GET,
      );
}
