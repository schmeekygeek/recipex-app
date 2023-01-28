import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class User {
  final String name;
  final String username;
  final String email;
  final String password;
  final List<String> savedRecipes;

  const User({
    required this.username,
    required this.name,
    required this.email,
    required this.password,
    required this.savedRecipes,
  });

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
