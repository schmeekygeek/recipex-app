import 'package:json_annotation/json_annotation.dart';
import './meals.dart';

part 'base.g.dart';

@JsonSerializable(
  explicitToJson: true
)

class Base {
  final List<Meals> meals;

  Base({
    required this.meals
  });

  factory Base.fromJson(Map<String, dynamic> data) => _$BaseFromJson(data);
  Map<String, dynamic> toJson() => _$BaseToJson(this);
}
