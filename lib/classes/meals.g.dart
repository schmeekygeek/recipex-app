// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      idMeal: json['idMeal'] as String?,
      strMeal: json['strMeal'] as String?,
      strCategory: json['strCategory'] as String?,
      strArea: json['strArea'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      strTags: json['strTags'] as String?,
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strMealThumb': instance.strMealThumb,
      'strTags': instance.strTags,
    };
