// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginContentModel _$LoginContentModelFromJson(Map<String, dynamic> json) =>
    LoginContentModel(
      credentials: json['creds'] as int? ?? 0,
      token: json['value'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$LoginContentModelToJson(LoginContentModel instance) =>
    <String, dynamic>{
      'creds': instance.credentials,
      'value': instance.token,
      'refreshToken': instance.refreshToken,
    };
