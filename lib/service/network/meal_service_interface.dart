import '../../classes/base.dart';
import '../../classes/categories_list.dart';
import '../../classes/meals.dart';

abstract class MealServiceInterface {

  Future<Base> fetchMealsByKeyword(String keyword);
  Future<CategoriesList> fetchAllCategories();
  Future<Base> fetchMealsByCategory(String category);
  Future<Meals> fetchMealById(String category);
  Future<Meals> fetchRandomMeal();
}
