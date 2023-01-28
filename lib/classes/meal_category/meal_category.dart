import 'package:json_annotation/json_annotation.dart';

part 'meal_category.g.dart';
@JsonSerializable(explicitToJson: true)
class MealCategory {

  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  MealCategory({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription
  });

  factory MealCategory.fromJson(Map<String, dynamic> data) => _$MealCategoryFromJson(data);
  Map<String, dynamic> toJson() => _$MealCategoryToJson(this);
}
