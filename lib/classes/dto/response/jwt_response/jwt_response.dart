import 'package:json_annotation/json_annotation.dart';

part 'jwt_response.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class JwtResponse {

  final String jwt;

  JwtResponse({
    required this.jwt,
  });

  factory JwtResponse.fromJson(Map<String, dynamic> data) => _$JwtResponseFromJson(data);
  Map<String, dynamic> toJson() => _$JwtResponseToJson(this);
}
