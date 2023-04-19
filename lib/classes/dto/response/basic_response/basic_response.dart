import 'package:json_annotation/json_annotation.dart';

part 'basic_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class BasicResponse {
  final String message;
  final bool wasSuccessful;

  const BasicResponse({
    required this.message,
    required this.wasSuccessful
  });

  factory BasicResponse.fromJson(Map<String, dynamic> data) => _$BasicResponseFromJson(data);
  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}
