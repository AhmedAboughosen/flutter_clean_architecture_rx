
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../httpClient/remote_data_source_service_impl.dart';
import '../networkSettings/http_base_url.dart';
import '../networkSettings/network_logger.dart';


extension DioOptions on RemoteDataSourceServiceImpl {

  Future initHttpClient() async {
    dio = Dio(
      BaseOptions(
          connectTimeout: 24000,
          receiveTimeout: 24000,
          responseType: ResponseType.json,
          baseUrl: HttpBaseUrl.httpBaseUrl.url),
    );

    //network logger
    if (!kReleaseMode) {
      dio.interceptors.add(dioLoggerInterceptor);
    }

  }

  Options setUpOptions(
      String requestMethod,
      Map<String, String>? headerParameters,
      bool isMultiPart,
      String userAgent,
      String contentTypeHeader,
      String authorization,
      ) {
    final header = {
      HttpHeaders.authorizationHeader: authorization,
      HttpHeaders.userAgentHeader: userAgent,
      HttpHeaders.contentTypeHeader: contentTypeHeader,
    };

    if (headerParameters != null) header.addAll(headerParameters);

    return Options(
      method: requestMethod,
      headers: header,
      sendTimeout: 28000,
      receiveTimeout: 28000,
      followRedirects: false,
      contentType: contentTypeHeader,
    );
  }

}