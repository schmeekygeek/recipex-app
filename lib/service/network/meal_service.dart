import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:recipex_app/classes/dto/response/basic_response/basic_response.dart';
import 'package:recipex_app/classes/exceptions/app_exceptions.dart';

import '../../classes/dto/request/jwt_request.dart';
import '../../classes/base/base.dart';
import '../../classes/categories_list/categories_list.dart';
import '../../classes/dto/response/jwt_response/jwt_response.dart';
import '../../classes/meals/meals.dart';
import '../../classes/user/user.dart';
import 'meal_service_interface.dart';

// fetch meals by keyword
class MealServiceImplementation implements MealServiceInterface {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1";
  final String serverBaseUrl = "http://localhost:8080/api/v1";
  var logger = Logger();
  http.Client client = http.Client();

  final Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  @override
  Future<Base> fetchMealsByKeyword(String keyword) async {
    keyword = keyword.trim().replaceAll(RegExp(r' '), '%20').toLowerCase();
    final response =
        await client.get(Uri.parse("$baseUrl/search.php?s=$keyword"));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals;
  }

  // fetch all categories
  @override
  Future<CategoriesList> fetchAllCategories() async {
    final response = await client.get(Uri.parse("$baseUrl/categories.php"));
    CategoriesList categories =
        CategoriesList.fromJson(jsonDecode(response.body));

    // remove pork category from the list
    categories.categories.removeAt(6);
    return categories;
  }

  // fetch meals by category
  @override
  Future<Base> fetchMealsByCategory(String category) async {
    final response =
        await client.get(Uri.parse("$baseUrl/filter.php/?c=$category"));
    Base categories = Base.fromJson(jsonDecode(response.body));
    return categories;
  }

  // fetch meal by id
  @override
  Future<Meals> fetchMealById(String id) async {
    final response = await client.get(Uri.parse("$baseUrl/lookup.php/?i=$id"));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals.meals[0];
  }

  // get recipe of the day
  @override
  Future<Meals> fetchRandomMeal() async {
    final response = await client.get(Uri.parse("$baseUrl/random.php"));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals.meals[0];
  }

  // get all saved recipes for user
  @override
  Future<Base> getAllSavedRecipes() async {
    throw UnimplementedError();
  }

  // login user
  @override
  Future<JwtResponse> login(JwtRequest jwtRequest) async {
    http.Response response;
    throw UnimplementedError();
  }

  // sign up user
  // TODO handle event of server being offline
  @override
  Future<JwtResponse> signup(User user) async {
    http.Response response;
    try {
      response = await client.post(
        Uri.parse("$serverBaseUrl/signup"),
        body: jsonEncode(user),
        headers: headers,
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
      print(e.runtimeType.toString());
      throw Exception();
    }
    switch (response.statusCode) {
      case 400:
        BasicResponse basicResponse =
            BasicResponse.fromJson(jsonDecode(response.body));
        if (basicResponse.message.contains("username")) {
          throw UsernameTakenException();
        } else if (basicResponse.message.contains("email")) {
          throw EmailTakenException();
        }
        break;
    }
      JwtResponse jwtResponse = JwtResponse.fromJson(jsonDecode(response.body));
      print(jwtResponse.jwt);
      return jwtResponse;
  }
}
