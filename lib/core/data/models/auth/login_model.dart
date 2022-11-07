import 'package:freezed_annotation/freezed_annotation.dart';
import '../base/response_model.dart';
import 'login_content_model.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends ResponseModel<LoginModel> {
  @JsonKey(name: 'creds', defaultValue: 0)
  final int? credentials;
  @JsonKey(name: 'value', defaultValue: '')
  final String? token;
  @JsonKey(name: 'refreshToken', defaultValue: '')
  final String? refreshToken;

  LoginModel({
    this.credentials,
    this.token,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel.fromJson(json);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
