import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../classes/meals.dart';
import '../providers/storage_provider.dart';
import '../shared/dashboard_widgets/category_blocks.dart';
import '../shared/meal_info_sheet.dart';
import '../service/greeting_service.dart';
import '../service/ingredient_service.dart';
import '../shared/dashboard_widgets/continue_box.dart';
import '../shared/dashboard_widgets/liked_box.dart';
import '../shared/dashboard_widgets/search_box.dart';

class Dashboard extends StatelessWidget {
  final PageController controller;
  const Dashboard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Icon(FontAwesomeIcons.barsStaggered)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${getGreeting()},",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 43,
              fontWeight: FontWeight.bold,
              fontFamily: "Sacramento",
            ),
          ),
          Text(
            "John",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  letterSpacing: 1,
                  fontSize: 40,
                  fontFamily: "ClashGrotesk",
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "BROWSE CATEGORIES:",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontFamily: "ClashGrotesk",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CategoryBlocks(),

          if(context.watch<StorageProvider>().lastMeal != null) 
          GestureDetector(
            onTap: () {
              Meals lastMeal = context.read<StorageProvider>().lastMeal!;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MealInfoSheet(
                  ingredients: buildIngredients(lastMeal),
                  meal: lastMeal,
                ),
              ));
            },
            child: const ContinueBox(),
          ),

          GestureDetector(
            onTap: () => controller.animateToPage(
              2,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                milliseconds: 200,
              ),
            ),
            child: const LikedBox(),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => controller.animateToPage(
              1,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                milliseconds: 200,
              ),
            ),
            child: const SearchBox(),
          ),
        ],
      ),
    );
  }
}
