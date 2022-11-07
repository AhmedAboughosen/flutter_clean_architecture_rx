

import 'package:equatable/equatable.dart';

abstract class BaseResponseModel<T> extends  Equatable {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}