import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/network/meal_service.dart';
import '../providers/theme_model.dart';

class Liked extends StatefulWidget {
  const Liked({super.key});

  @override
  State<Liked> createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              "Liked recipes",
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                  Image.asset(
                    context.watch<ThemeModel>().isDark
                        ? "assets/girl-cycle-dark.png"
                        : "assets/girl-cycle-light.png",
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
            ),
          ),
        ],
      ),
    );
  }
}
