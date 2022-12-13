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
            expandedHeight: 230,
            title: Text(meal.strMeal ?? "Unknown"),
            titleTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
            iconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
            titleSpacing: 2,
            elevation: 10,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextSpan(
                          text: meal.strArea ?? "N/A",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.normal
                          ),
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextSpan(
                          text: meal.strCategory ?? "N/A",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.normal
                          ),
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextSpan(
                          text: meal.strTags?.replaceAll(r',', ', ') ?? "N/A",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.normal
                          ),
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
                      Text(
                        "Ingredients  ",
                        style: Theme.of(context).textTheme.headlineMedium,
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
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            ingredient.measure,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodySmall,
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
                    children: [
                      Text(
                        "Instructions  ",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Icon(
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
                    style: Theme.of(context).textTheme.bodySmall,
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
