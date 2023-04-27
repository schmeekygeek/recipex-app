import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../extensions.dart';
import '../classes/meals/meals.dart';
import '../service/ingredient_service.dart';
import '../shared/meal_info_sheet.dart';
import '../shared/meal_list_tile.dart';
import '../shared/search_bar.dart';
import '../service/network/meal_service.dart';
import '../providers/meal_list_provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      // implement animated list
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What's\ncooking?",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 45),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SearchBar(),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      LottieBuilder.asset(
                        width: 100,
                        frameRate: FrameRate.max,
                        repeat: true,
                        'assets/loading2.json',
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
                } else {
                  if (snapshot.error is TypeError) {
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
                          'Couldn\'t fetch results for "${context.read<MealListProvider>().getInput}"\nTry something else?',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                        ),
                      ],
                    );
                  } else if (snapshot.error is SocketException) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 180,
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
                              'No internet connection',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                }
              },
              future: mealService.fetchMealsByKeyword(
                context.watch<MealListProvider>().getInput,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
