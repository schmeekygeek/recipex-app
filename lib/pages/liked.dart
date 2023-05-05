import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../extensions.dart';
import '../classes/base/base.dart';
import '../classes/meals/meals.dart';
import '../service/ingredient_service.dart';
import '../service/network/meal_service.dart';
import '../providers/theme_model.dart';
import '../shared/meal_info_sheet.dart';
import '../shared/meal_list_tile.dart';

class Liked extends StatefulWidget {
  const Liked({super.key});

  @override
  State<Liked> createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  void initState() {
    super.initState();
  }

  Future<Base> getLikedRecipes() async {
    var recipeIds = await mealService.getLikedRecipes();
    if (recipeIds.isEmpty) return Base(meals: []);
    Base base = Base(meals: []);
    for (String recipeId in recipeIds) {
      base.meals.add(await mealService.fetchMealById(recipeId));
    }
    return base;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              'Liked recipes',
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: getLikedRecipes(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height / 4),
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 90,
                      child: Column(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Icon(
                              FontAwesomeIcons.triangleExclamation,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Something went wrong',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data?.meals.isEmpty ?? false) {
                    return Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 9,
                          ),
                          Image.asset(
                            context.watch<ThemeModel>().isDark
                                ? 'assets/girl-cycle-dark.png'
                                : 'assets/girl-cycle-light.png',
                            height: 150,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Once you like a recipe, we'll show it here",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  List<Meals> meals = snapshot.data!.meals;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      for (Meals meal in meals)
                      GestureDetector(
                        onTap: () => context.push(
                          MealInfoSheet(
                            ingredients: buildIngredients(meal),
                            meal: meal,
                          ),
                        ),
                        child: MealListTile(meal),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    LottieBuilder.asset(
                      width: 100,
                      frameRate: FrameRate.max,
                      repeat: true,
                      'assets/loading2.json',
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
