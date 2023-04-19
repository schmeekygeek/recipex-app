import '../../classes/base/base.dart';
import '../../classes/categories_list/categories_list.dart';
import '../../classes/dto/request/jwt_request.dart';
import '../../classes/dto/response/jwt_response/jwt_response.dart';
import '../../classes/meals/meals.dart';
import '../../classes/user/user.dart';

abstract class MealServiceInterface {

  Future<Base> fetchMealsByKeyword(String keyword);
  Future<CategoriesList> fetchAllCategories();
  Future<Base> fetchMealsByCategory(String category);
  Future<Meals> fetchMealById(String category);
  Future<Meals> fetchRandomMeal();

  Future<JwtResponse> signup(User user);
  Future<JwtResponse> login(JwtRequest jwtRequest);
  Future<Base> getAllSavedRecipes();
}
