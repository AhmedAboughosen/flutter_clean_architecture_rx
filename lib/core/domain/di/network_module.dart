import 'package:flutter_clean_architecture_rx/infrastructure/remoteDataSource/httpClient/remote_data_source_service_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../infrastructure/remoteDataSource/httpClient/remote_data_source_service.dart';
import '../../../infrastructure/remoteDataSource/networkSettings/network_info.dart';

@module
abstract class NetworkModule {
  RemoteDataSourceService getHttpConnection(
          NetworkInfo networkInfo) =>
      RemoteDataSourceServiceImpl(networkInfo);

  NetworkInfo getNetworkInfo() => NetworkInfoImpl(InternetConnectionChecker());


}
