import 'dart:convert' as convert;

import 'package:dio/dio.dart';

import '../../../core/data/exception/core_exception.dart';
import '../../../core/data/models/base/base_response_model.dart';
import '../../../core/data/models/base/response_model.dart';
import '../httpClient/remote_data_source_service.dart';

extension HandleResponse on RemoteDataSourceService {
  T createResponse<T extends BaseResponseModel>(
      ItemCreator<T> creator, Response<String> response) {
    var dataResponse = creator() as ResponseModel;

    Map<String, dynamic> messageResponse = {};

    if (response.statusCode != 200) {
      throw Stream.error(CoreException(
        "حدث خطأ ما في طلبك ، يرجى المحاولة مرة أخرى",
      ));
    } else {
      try {
        messageResponse = convert.jsonDecode(response.data!);
        dataResponse = dataResponse.fromJson(messageResponse);
      } catch (e) {
        throw Stream.error(CoreException(
          "حدث خطأ ما في طلبك ، يرجى المحاولة مرة أخرى",
        ));
      }

      return dataResponse as T;
    }
  }
}
