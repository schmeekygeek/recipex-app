import '../classes/ingredient.dart';
import '../classes/meals/meals.dart';

List<Ingredient> buildIngredients(Meals meal) {
  List<Ingredient> ingredients = [];

  meal.strIngredient1 != null && meal.strIngredient1!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient1!, measure: meal.strMeasure1!))
      : () {};
  meal.strIngredient2 != null && meal.strIngredient2!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient2!, measure: meal.strMeasure2!))
      : () {};
  meal.strIngredient3 != null && meal.strIngredient3!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient3!, measure: meal.strMeasure3!))
      : () {};
  meal.strIngredient4 != null && meal.strIngredient4!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient4!, measure: meal.strMeasure4!))
      : () {};
  meal.strIngredient5 != null && meal.strIngredient5!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient5!, measure: meal.strMeasure5!))
      : () {};
  meal.strIngredient6 != null && meal.strIngredient6!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient6!, measure: meal.strMeasure6!))
      : () {};
  meal.strIngredient7 != null && meal.strIngredient7!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient7!, measure: meal.strMeasure7!))
      : () {};
  meal.strIngredient8 != null && meal.strIngredient8!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient8!, measure: meal.strMeasure8!))
      : () {};
  meal.strIngredient9 != null && meal.strIngredient9!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient9!, measure: meal.strMeasure9!))
      : () {};
  meal.strIngredient10 != null && meal.strIngredient10!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient10!, measure: meal.strMeasure10!))
      : () {};
  meal.strIngredient11 != null && meal.strIngredient11!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient11!, measure: meal.strMeasure11!))
      : () {};
  meal.strIngredient12 != null && meal.strIngredient12!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient12!, measure: meal.strMeasure12!))
      : () {};
  meal.strIngredient13 != null && meal.strIngredient13!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient13!, measure: meal.strMeasure13!))
      : () {};
  meal.strIngredient14 != null && meal.strIngredient14!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient14!, measure: meal.strMeasure14!))
      : () {};
  meal.strIngredient15 != null && meal.strIngredient15!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient15!, measure: meal.strMeasure15!))
      : () {};
  meal.strIngredient16 != null && meal.strIngredient16!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient16!, measure: meal.strMeasure16!))
      : () {};
  meal.strIngredient17 != null && meal.strIngredient17!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient17!, measure: meal.strMeasure17!))
      : () {};
  meal.strIngredient18 != null && meal.strIngredient18!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient18!, measure: meal.strMeasure18!))
      : () {};
  meal.strIngredient19 != null && meal.strIngredient19!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient19!, measure: meal.strMeasure19!))
      : () {};
  meal.strIngredient20 != null && meal.strIngredient20!.isNotEmpty
      ? ingredients.add(Ingredient(
          ingredient: meal.strIngredient20!, measure: meal.strMeasure20!))
      : () {};

  return ingredients;
}
