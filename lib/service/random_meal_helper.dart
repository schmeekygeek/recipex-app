// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/storage_provider.dart';
import '../classes/meals.dart';
import './network/meal_service.dart';

class RandomMealHelper {

  static Future<Meals> fetchROTD(BuildContext context) async {
    String rotdId = context.read<StorageProvider>().getRotd;
    MealServiceImplementation mealService = MealServiceImplementation();
    Meals meal;

    // 5285819
    if(rotdId.substring(5) == DateTime.now().day.toString()) {
      meal = await mealService.fetchMealById(rotdId.substring(0, 5));
      return meal;
    }
    
    meal = await mealService.fetchRandomMeal();
    context.read<StorageProvider>().setRotd("${meal.idMeal}${DateTime.now().day.toString()}");
    return meal;
  }
}
