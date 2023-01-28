
import 'package:json_annotation/json_annotation.dart';

part 'recipe_list_response.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class RecipeListResponse {

  final List<String> savedRecipes;

  RecipeListResponse({
    required this.savedRecipes,
  });

  factory RecipeListResponse.fromJson(Map<String, dynamic> data) => _$RecipeListResponseFromJson(data);
  Map<String, dynamic> toJson() => _$RecipeListResponseToJson(this);

}
