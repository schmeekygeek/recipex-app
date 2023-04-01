import 'package:json_annotation/json_annotation.dart';

part 'basic_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class BasicResponse {
  final String cause;
  final bool wasSuccessful;

  const BasicResponse({
    required this.cause,
    required this.wasSuccessful
  });

  factory BasicResponse.fromJson(Map<String, dynamic> data) => _$BasicResponseFromJson(data);
  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}
