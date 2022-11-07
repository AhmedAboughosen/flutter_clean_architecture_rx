
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/data/exception/network_exception.dart';
import '../httpClient/remote_data_source_service_impl.dart';

extension NetworkChecker on RemoteDataSourceServiceImpl {


  Stream<bool> networkState(){
    return networkInfo.isConnected.asStream();

    // var isConnected = await networkInfo.isConnected;
    //
    // if (!isConnected) {
    //
    //   throw NetworkException(
    //     'نرجو منك التحقق من شبكة الانترنت.',
    //   );
    // }

  }
}