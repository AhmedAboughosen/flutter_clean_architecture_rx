import 'dart:async';

import '../../../core/data/models/base/base_response_model.dart';

typedef ItemCreator<S extends BaseResponseModel> = S Function();

abstract class RemoteDataSourceService {
  Stream<T> requestService<T extends BaseResponseModel>(ItemCreator<T> creator,
      {required String endPoint,
      String contentTypeHeader,
      required String requestMethod,
      Map<String, dynamic> queryParameters,
      Object dataParameters,
      Map<String, String> headerParameters,
      bool isMultiPart = false,
      String authorization = '',
      String baseUrl = '',
      String userAgent});
}
