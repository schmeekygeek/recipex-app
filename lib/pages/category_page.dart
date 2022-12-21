import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipex_app/classes/ingredient.dart';
import 'package:recipex_app/classes/meals.dart';
import 'package:recipex_app/pages/loading_sheet.dart';
import 'package:recipex_app/service/ingredient_service.dart';
import 'package:recipex_app/service/meal_service.dart';
import 'package:recipex_app/shared/meal_info_sheet.dart';
import 'package:recipex_app/shared/meal_list_tile.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final String imgUrl;
  const CategoryPage({super.key, required this.category, required this.imgUrl});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(widget.category),
              automaticallyImplyLeading: true,
              expandedHeight: 230,
              titleTextStyle:
                  Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
              iconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
              stretch: true,
              titleSpacing: 2,
              elevation: 10,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) =>
                          Image.asset("assets/not_found.png"),
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.55),
                        BlendMode.dstATop,
                      ),
                      image: NetworkImage(widget.imgUrl),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          for (Meals meal in snapshot.data!.meals)
                            GestureDetector(
                              onTap: () async {
                                showModalBottomSheet(
                                  context: context,
                                  // isDismissible: false,
                                  transitionAnimationController:
                                      AnimationController(
                                    vsync: this,
                                    duration: const Duration(
                                      milliseconds: 200,
                                    ),
                                  ),
                                  builder: (context) => const LoadingSheet(),
                                );
                                Meals mealData =
                                    await fetchMealById(meal.idMeal!);
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
            ),
          ],
        ),
      ),
    );
  }
}
