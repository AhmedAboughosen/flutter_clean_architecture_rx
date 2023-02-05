import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_rx/infrastructure/remoteDataSource/httpHandler/handle_response.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/data/exception/core_exception.dart';
import '../../../core/data/exception/network_exception.dart';
import '../../../core/data/models/base/base_response_model.dart';
import '../extension/dio_options.dart';
import '../extension/network_checker.dart';
import '../networkSettings/network_info.dart';
import 'remote_data_source_service.dart';

class RemoteDataSourceServiceImpl implements RemoteDataSourceService {
  final NetworkInfo networkInfo;

  late Dio dio;
  late String fullUrl;

  RemoteDataSourceServiceImpl(this.networkInfo) {
    initHttpClient();
  }

  @override
  Stream<T> requestService<T extends BaseResponseModel>(ItemCreator<T> creator,
      {required String endPoint,
      required String requestMethod,
      String contentTypeHeader = 'application/json',
      Map<String, dynamic>? queryParameters,
      Object? dataParameters,
      Map<String, String>? headerParameters,
      bool isMultiPart = false,
      String authorization = '',
      String baseUrl = '',
      String userAgent = ''}) {
    // create url
    fullUrl = baseUrl + endPoint;

    //create options
    final options = setUpOptions(requestMethod, headerParameters, isMultiPart,
        userAgent, contentTypeHeader, authorization);

    var networkStateStream = networkState().share();

    //request
    final response = dio
        .request<String>(
          fullUrl,
          options: options,
          queryParameters: queryParameters,
          data: dataParameters,
        )
        .asStream();

    var message = Rx.merge<T>([
      networkStateStream
          .where((valid) => !valid)
          .map((_) => throw Stream.error(NetworkException(
                'نرجو منك التحقق من شبكة الانترنت.',
              ))),
      networkStateStream
          .where((valid) => valid)
          .flatMap((_) => response.map((data) {
                return createResponse<T>(creator, data);
              })),
    ]);

    return message;
  }
}
