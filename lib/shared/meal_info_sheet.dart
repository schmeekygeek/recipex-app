import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/theme_model.dart';
import '../service/metadata.dart';
import '../classes/ingredient.dart';
import '../classes/meals.dart';

class MealInfoSheet extends StatelessWidget {
  final Meals meal;
  final List<Ingredient> ingredients;
  const MealInfoSheet({
    required this.ingredients,
    required this.meal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    context.watch<ThemeModel>().isDark
                        ? FontAwesomeIcons.solidLightbulb
                        : Icons.dark_mode_rounded,
                  ),
                  onPressed: () => context.read<ThemeModel>().toggle(),
                ),
              ],
              automaticallyImplyLeading: true,
              expandedHeight: 230,
              title: null,
              titleTextStyle:
                  Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
              iconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
              stretch: true,
              titleSpacing: 2,
              elevation: 10,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      onError: (error, stackTrace) =>
                          Image.asset("assets/not_found.png"),
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.55),
                        BlendMode.dstATop,
                      ),
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
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.strMeal ?? "Unknown",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    metaData(
                      context,
                      "Origin: ",
                      meal.strArea,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    metaData(
                      context,
                      "Category: ",
                      meal.strCategory,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    metaData(
                      context,
                      "Tags: ",
                      meal.strTags ?? "N/A",
                    ),
                    const SizedBox(
                      height: 10,
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
      ),
    );
  }
}
