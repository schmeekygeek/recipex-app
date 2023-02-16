import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/meals/meals.dart';
import '../service/network/meal_service.dart';
import '../shared/meal_list_tile.dart';
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
              child: FutureBuilder(
                future: mealService.getAllSavedRecipes(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: [ 
                        for(Meals meal in snapshot.data!.meals) MealListTile(meal)
                      ],
                    );
                  }
                  else if(snapshot.hasError) {

                    return const Text("Couldn't connect to the internet");
                  }
                  else if(snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  else if(snapshot.data!.meals.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 9,
                        ),
                        Image.asset(
                          context.watch<ThemeModel>().isDark ? 
                          "assets/girl-cycle-dark.png" :
                          "assets/girl-cycle-light.png",
                          height: 150,
                        ),
                        const SizedBox(height: 20,),
                        const Text(
                          "Once you like a recipe, we'll show it here",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  else {
                    return const Text("Something went wrong");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
