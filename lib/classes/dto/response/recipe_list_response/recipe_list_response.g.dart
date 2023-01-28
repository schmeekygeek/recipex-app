// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeListResponse _$RecipeListResponseFromJson(Map<String, dynamic> json) =>
    RecipeListResponse(
      savedRecipes: (json['savedRecipes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeListResponseToJson(RecipeListResponse instance) =>
    <String, dynamic>{
      'savedRecipes': instance.savedRecipes,
    };
