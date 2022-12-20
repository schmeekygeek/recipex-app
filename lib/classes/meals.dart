import 'package:json_annotation/json_annotation.dart';

part 'meals.g.dart';

@JsonSerializable(explicitToJson: true)
class Meals {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strMealThumb;
  String? strTags;
  String? strInstructions;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;

  Meals({ 
      this.idMeal,
      this.strMeal,
      this.strCategory,
      this.strArea,
      this.strMealThumb,
      this.strTags,
      this.strInstructions,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strIngredient16,
      this.strIngredient17,
      this.strIngredient18,
      this.strIngredient19,
      this.strIngredient20,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strMeasure16,
      this.strMeasure17,
      this.strMeasure18,
      this.strMeasure19,
      this.strMeasure20,
    });

  get getMealId => idMeal;
  get getMeal => strMeal;
  get getMealThumb => strMealThumb;

  factory Meals.fromJson(Map<String, dynamic> data) => _$MealsFromJson(data);
  Map<String, dynamic> toJson() => _$MealsToJson(this);
}
