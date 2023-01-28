import 'package:json_annotation/json_annotation.dart';
import 'package:recipex_app/classes/meal_category.dart';

part 'categories_list.g.dart';

@JsonSerializable(
 explicitToJson: true
)
class CategoriesList {
  final List<MealCategory> categories;

  CategoriesList({
    required this.categories,
  });

  factory CategoriesList.fromJson(Map<String, dynamic> data) => _$CategoriesListFromJson(data);
  Map<String, dynamic> toJson() => _$CategoriesListToJson(this);
}
