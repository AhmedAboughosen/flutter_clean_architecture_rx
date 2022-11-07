import 'package:json_annotation/json_annotation.dart';

import 'base_response_model.dart';

@JsonSerializable()
abstract class ResponseModel<T> extends BaseResponseModel<T> {

}
