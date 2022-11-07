import 'package:dio/dio.dart';

import '../../../core/data/exception/authentication_exception.dart';
import '../../../core/data/exception/core_exception.dart';
import '../../../core/data/models/base/base_response_model.dart';
import '../httpClient/remote_data_source_service_impl.dart';

extension HandleException on RemoteDataSourceServiceImpl {
  Future<T> handleException<T extends BaseResponseModel>(
    e,
    String responseString,
    Object? dataParameters,
  ) async {
    if (e != null && e is DioError) {
      if (e.type == DioErrorType.connectTimeout || e.response == null) {
        throw CoreException(
          "حدث خطأ ما في طلبك ، يرجى المحاولة مرة أخرى",
        );
      }

      if ((e.response != null) &&
          ((e.response!.statusCode != null) &&
              (e.response!.statusCode == 401 ||
                  e.response!.statusCode == 403))) {
        throw AuthenticationException("exceptionNetworkUnAuthorized");
      }
    }


    throw CoreException(
      "$e",
    );
  }
}
