import 'package:json_annotation/json_annotation.dart';

part 'jwt_request.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class JwtRequest {
  final String username;
  final String password;

  const JwtRequest({
    required this.username,
    required this.password,
  });

  factory JwtRequest.fromJson(Map<String, dynamic> data) => _$JwtRequestFromJson(data);
  Map<String, dynamic> toJson() => _$JwtRequestToJson(this);

}

