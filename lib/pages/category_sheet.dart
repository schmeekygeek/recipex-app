import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../classes/ingredient.dart';
import '../classes/meals.dart';
import '../service/ingredient_service.dart';
import '../service/meal_service.dart';
import '../shared/meal_info_sheet.dart';
import '../shared/meal_list_tile.dart';

class CategorySheet extends StatefulWidget {

  final String category;
  final String imgUrl;

  const CategorySheet({
    super.key,
    required this.category,
    required this.imgUrl,
  });

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}
class _CategorySheetState extends State<CategorySheet>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${widget.category}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  for (Meals meal in snapshot.data!.meals)
                    GestureDetector(
                      onTap: () async {
                        showDialog(
                          builder: (context) => Dialog.fullscreen(
                            backgroundColor: Colors.transparent,
                            child: LottieBuilder.asset(
                              "assets/loading1.json",
                              height: 200,
                              frameRate: FrameRate.max,
                            ),
                          ),
                          context: context,
                        );
                        Meals mealData = await fetchMealById(meal.idMeal!);
                        if (mounted) {
                          List<Ingredient> ingredients =
                              buildIngredients(mealData);
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MealInfoSheet(
                                ingredients: ingredients,
                                meal: mealData,
                              ),
                            ),
                          );
                        }
                      },
                      child: MealListTile(meal),
                    ),
                ],
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                LottieBuilder.asset(
                  width: 100,
                  frameRate: FrameRate.max,
                  "assets/loading2.json",
                ),
              ],
            );
          },
          future: fetchMealsByCategory(widget.category),
        ),
      ),
    );
  }
}
