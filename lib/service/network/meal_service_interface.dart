import '../../classes/base/base.dart';
import '../../classes/categories_list/categories_list.dart';
import '../../classes/meals/meals.dart';

abstract class MealServiceInterface {

  Future<Base> fetchMealsByKeyword(String keyword);
  Future<CategoriesList> fetchAllCategories();
  Future<Base> fetchMealsByCategory(String category);
  Future<Meals> fetchMealById(String category);
  Future<Meals> fetchRandomMeal();

  Future emailSignUp(String email, String password, String username);
  Future likeRecipe(String recipeId);
  Future<List<String>> getLikedRecipes();
}
