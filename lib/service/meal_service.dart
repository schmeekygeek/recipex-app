import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipex_app/classes/categories_list.dart';
import 'package:recipex_app/classes/meals.dart';

import '../classes/base.dart';

const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

// fetch meals by keyword
Future<Base> fetchMealsByKeyword(String keyword) async {

  keyword = keyword.trim().replaceAll(RegExp(r' '), '%20').toLowerCase();
  final response = await http.get(Uri.parse("$baseUrl/search.php?s=$keyword"));
  if(response.statusCode != 200){
    throw Exception("Error occured");
  }
  Base meals = Base.fromJson(jsonDecode(response.body));
  return meals;
}

// fetch all categories
Future<CategoriesList> fetchAllCategories() async {
  final response = await http.get(Uri.parse("$baseUrl/categories.php"));
  CategoriesList categories = CategoriesList.fromJson(jsonDecode(response.body));
  return categories;
}

// fetch meals by category
Future<Base> fetchMealsByCategory(String category) async {
  final response = await http.get(Uri.parse("$baseUrl/filter.php/?c=$category"));
  Base categories = Base.fromJson(jsonDecode(response.body));
  return categories;
}

// fetch meal by id
Future<Meals> fetchMealById(String id) async {
  final response = await http.get(Uri.parse("$baseUrl/lookup.php/?i=$id"));
  Meals meal = Meals.fromJson(jsonDecode(response.body));
  return meal;
}
