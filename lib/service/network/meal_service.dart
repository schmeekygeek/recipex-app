import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipex_app/classes/meal_category.dart';

import '../../classes/base.dart';
import '../../classes/categories_list.dart';
import '../../classes/meals.dart';
import 'meal_service_interface.dart';


const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

// fetch meals by keyword
class MealServiceImplementation implements MealServiceInterface { 

  @override
  Future<Base> fetchMealsByKeyword(String keyword) async {
    keyword = keyword.trim().replaceAll(RegExp(r' '), '%20').toLowerCase();
    late http.Response response;
    response = await http.get(Uri.parse("$baseUrl/search.php?s=$keyword"));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals;
  }

  // fetch all categories
  @override
  Future<CategoriesList> fetchAllCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/categories.php"));
    CategoriesList categories = CategoriesList.fromJson(jsonDecode(response.body));
    categories.categories.removeAt(6);
    return categories;
  }

  // fetch meals by category
  @override
  Future<Base> fetchMealsByCategory(String category) async {
    final response = await http.get(Uri.parse("$baseUrl/filter.php/?c=$category"));
    Base categories = Base.fromJson(jsonDecode(response.body));
    return categories;
  }

  // fetch meal by id
  @override
  Future<Meals> fetchMealById(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/lookup.php/?i=$id"));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals.meals[0];
  }

  // get recipe of the day
  @override
  Future<Meals> fetchRandomMeal() async {
    final response = await http.get(Uri.parse("$baseUrl/random.php"));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals.meals[0];
  }

 }
