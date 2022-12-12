import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/theme_model.dart';

import '../classes/ingredient.dart';
import '../classes/meals.dart';
import 'meal_list_tile.dart';

class MealInfoSheet extends StatelessWidget {
  final Meals meal;
  final List<Ingredient> ingredients;
  const MealInfoSheet(
      {required this.ingredients, required this.meal, super.key});
  static const double categorySize = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                icon: Icon(context.watch<ThemeModel>().isDark
                    ? FontAwesomeIcons.solidLightbulb
                    : Icons.dark_mode_rounded),
                onPressed: () => context.read<ThemeModel>().toggle(),
              ),
            ],
            automaticallyImplyLeading: true,
            expandedHeight: 200,
            title: Text(meal.strMeal ?? "Unknown"),
            titleTextStyle: TextStyle(
                fontSize: 25,
                fontFamily: "SpaceGrotesk",
                color: context.watch<ThemeModel>().isDark
                    ? Colors.white
                    : Colors.black87,
                fontWeight: FontWeight.w600),
            titleSpacing: 2,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    onError: (error, stackTrace) =>
                        Image.asset("assets/not_found.png"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.55), BlendMode.xor),
                    image: NetworkImage(
                      meal.strMealThumb!,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Origin: ",
                          style: TextStyle(
                              height: 1.5,
                              color: context.watch<ThemeModel>().isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontFamily: MealListTile.itemTitleFont,
                              fontSize: categorySize,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: meal.strArea ?? "N/A",
                          style: TextStyle(
                              color: context.watch<ThemeModel>().isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontFamily: MealListTile.itemTitleFont,
                              fontSize: categorySize,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Category: ",
                          style: TextStyle(
                              height: 1.5,
                              color: context.watch<ThemeModel>().isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontFamily: MealListTile.itemTitleFont,
                              fontSize: categorySize,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: meal.strCategory ?? "N/A",
                          style: TextStyle(
                              color: context.watch<ThemeModel>().isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontFamily: MealListTile.itemTitleFont,
                              fontSize: categorySize,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Tags: ",
                          style: TextStyle(
                              height: 1.5,
                              color: context.watch<ThemeModel>().isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontFamily: MealListTile.itemTitleFont,
                              fontSize: categorySize,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: meal.strTags?.replaceAll(r',', ', ') ?? "N/A",
                          style: TextStyle(
                              color: context.watch<ThemeModel>().isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontFamily: MealListTile.itemTitleFont,
                              fontSize: categorySize,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    height: 23,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Ingredients  ",
                        style: TextStyle(
                          fontSize: 38,
                          fontFamily: "Quincy",
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.carrot,
                        color: Colors.red.shade300,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (Ingredient ingredient in ingredients)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            ingredient.ingredient,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "RobotoSlab",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            ingredient.measure,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "RobotoSlab",
                              letterSpacing: 1,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    height: 23,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Instructions  ",
                        style: TextStyle(
                          fontSize: 38,
                          fontFamily: "Quincy",
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.bowlRice,
                        color: Colors.lightGreen,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    meal.strInstructions ??
                        "No instructions available for this recipe",
                    style: const TextStyle(
                      fontSize: 15,
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontFamily: "RobotoSlab",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
