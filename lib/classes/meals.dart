import 'package:json_annotation/json_annotation.dart';

part 'meals.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class Meals {
  final String? idMeal;
  final String? strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strMealThumb;
  final String? strTags;

  Meals({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strMealThumb,
    required this.strTags
  });

  get getMealId => idMeal;
  get getMeal => strMeal;
  get getMealThumb => strMealThumb;

  factory Meals.fromJson(Map<String, dynamic> data) => _$MealsFromJson(data);
  Map<String, dynamic> toJson() => _$MealsToJson(this);
}
