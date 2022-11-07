import 'package:flutter_clean_architecture_rx/infrastructure/remoteDataSource/httpClient/remote_data_source_service.dart';
import 'package:rxdart/rxdart.dart';
abstract class BaseRepository {
  final RemoteDataSourceService? remoteDataSourceService;

  BaseRepository({this.remoteDataSourceService});

  String endPoint();


}
