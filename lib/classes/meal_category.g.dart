// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategory _$MealCategoryFromJson(Map<String, dynamic> json) => MealCategory(
      idCategory: json['idCategory'] as String,
      strCategory: json['strCategory'] as String,
      strCategoryThumb: json['strCategoryThumb'] as String,
      strCategoryDescription: json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$MealCategoryToJson(MealCategory instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
