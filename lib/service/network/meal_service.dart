import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../classes/base/base.dart';
import '../../classes/user/user.dart' as my_user;
import '../../classes/categories_list/categories_list.dart';
import '../../classes/meals/meals.dart';
import 'meal_service_interface.dart';

// fetch meals by keyword
class MealServiceImplementation implements MealServiceInterface {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  var logger = Logger();

  http.Client client = http.Client();

  @override
  Future<Base> fetchMealsByKeyword(String keyword) async {
    keyword = keyword.trim().replaceAll(RegExp(r' '), '%20').toLowerCase();
    final response =
        await client.get(Uri.parse('$baseUrl/search.php?s=$keyword'));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals;
  }

  // fetch all categories
  @override
  Future<CategoriesList> fetchAllCategories() async {
    final response = await client.get(Uri.parse('$baseUrl/categories.php'));
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
        await client.get(Uri.parse('$baseUrl/filter.php/?c=$category'));
    Base categories = Base.fromJson(jsonDecode(response.body));
    return categories;
  }

  // fetch meal by id
  @override
  Future<Meals> fetchMealById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/lookup.php/?i=$id'));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals.meals[0];
  }

  // get recipe of the day
  @override
  Future<Meals> fetchRandomMeal() async {
    final response = await client.get(Uri.parse('$baseUrl/random.php'));
    Base meals = Base.fromJson(jsonDecode(response.body));
    return meals.meals[0];
  }

  // sign up user
  @override
  Future emailSignUp(String email, String password, String username) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    )
        .then((value) async {
      await value.user?.updateDisplayName(username.trim());
      final db = FirebaseFirestore.instance;
      final docRef = db
          .collection('/users')
          .doc(FirebaseAuth.instance.currentUser?.displayName);
      my_user.User user = my_user.User(recipes: []);
      docRef.set(user.toFirestore());
    });
  }

  @override
  Future<bool> likeRecipe(String recipeId) async {
    bool wasLiked = false;
    final db = FirebaseFirestore.instance;
    String username = FirebaseAuth.instance.currentUser?.displayName ?? '';
    List<String> recipes = await getLikedRecipes();
    final docRef = db.collection('/users').doc(username);
    if (recipes.contains(recipeId)) {
      recipes.remove(recipeId);
      wasLiked = false;
    }
    else {
      recipes.insert(0, recipeId);
      wasLiked = true;
    }
    my_user.User user = my_user.User(recipes: recipes);
    docRef.set(user.toFirestore());
    return wasLiked;
  }

  @override
  Future removeLikedRecipe(String recipeId) {
    // TODO: implement removeLikedRecipe
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getLikedRecipes() async {
    final db = FirebaseFirestore.instance;
    late List<String> recipes = [];
    String username = FirebaseAuth.instance.currentUser?.displayName ?? '';
    final docRef = db.collection('/users').doc(username);
    await docRef.get().then(
      (snapshot) {
        recipes = my_user.User.fromFirestore(snapshot).recipes ?? [];
      },
    );
    return recipes;
  }
}
