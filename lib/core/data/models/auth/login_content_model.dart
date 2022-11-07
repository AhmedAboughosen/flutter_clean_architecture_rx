import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/base_response_model.dart';

part 'login_content_model.g.dart';

@JsonSerializable()
class LoginContentModel extends BaseResponseModel<LoginContentModel> {
  @JsonKey(name: 'creds', defaultValue: 0)
  final int? credentials;
  @JsonKey(name: 'value', defaultValue: '')
  final String? token;
  @JsonKey(name: 'refreshToken', defaultValue: '')
  final String? refreshToken;

  LoginContentModel({
    this.credentials,
    this.token,
    this.refreshToken,
  });

  factory LoginContentModel.fromJson(Map<String, dynamic> json) {
    return _$LoginContentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginContentModelToJson(this);

  @override
  LoginContentModel fromJson(Map<String, dynamic> json) {
    return LoginContentModel.fromJson(json);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [credentials,token,refreshToken];
}
