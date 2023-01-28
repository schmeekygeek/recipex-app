// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesList _$CategoriesListFromJson(Map<String, dynamic> json) =>
    CategoriesList(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => MealCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesListToJson(CategoriesList instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
