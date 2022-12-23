import 'package:flutter/material.dart';

import '../classes/meal_category.dart';
import '../service/meal_service.dart';
import '../shared/category_list_tile.dart';
import 'category_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Good morning,\nJohn",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: "SpaceGrotesk",
              letterSpacing: 1
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Categories"),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: fetchAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MealCategory> categories =
                    snapshot.data!.categories;
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              imgUrl: categories[index].strCategoryThumb,
                              category: categories[index].strCategory,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CategoryListTile(
                            idCategory: categories[index].idCategory,
                            strCategory: categories[index].strCategory,
                            strCategoryThumb:
                                categories[index].strCategoryThumb,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
