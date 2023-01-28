// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtRequest _$JwtRequestFromJson(Map<String, dynamic> json) => JwtRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$JwtRequestToJson(JwtRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
