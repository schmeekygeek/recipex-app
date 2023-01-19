import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../service/ingredient_service.dart';
import '../shared/meal_info_sheet.dart';
import '../shared/meal_list_tile.dart';
import '../shared/search_bar.dart';
import '../classes/meals.dart';
import '../service/network/meal_service.dart';
import '../providers/meal_list_provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {

  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              "What's cooking?",
              style: Theme.of(context).appBarTheme.toolbarTextStyle),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SearchBar(),
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                            LottieBuilder.asset(
                              width: 100,
                              frameRate: FrameRate.max,
                              repeat: true,
                              "assets/loading2.json",
                            ),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        List<Meals> meals = snapshot.data!.meals;
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              for (Meals meal in meals)
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MealInfoSheet(
                                      ingredients: buildIngredients(meal),
                                      meal: meal,
                                    ),
                                  ),
                                ),
                                child: MealListTile(meal),
                              ),
                            ],
                          );
                      }
                      else {
                        if(snapshot.error.runtimeType.toString() == "_CastError") {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                              ),
                              Icon(
                                FontAwesomeIcons.triangleExclamation,
                                color: Colors.redAccent.shade100,
                                size: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Couldn't fetch results for \"${context.read<MealListProvider>().input}\"\nTry something else?",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18, letterSpacing: 1,),
                              ),
                            ],
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                            Icon(
                              FontAwesomeIcons.xmark,
                              color: Colors.redAccent.shade100,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You do not have an internet connection.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 20, letterSpacing: 1,),
                            ),
                          ],
                        );
                      }
                    },
                    future: mealService.fetchMealsByKeyword(
                      context.watch<MealListProvider>().input,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
