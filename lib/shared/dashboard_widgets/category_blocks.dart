import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions.dart';
import '../../pages/no_internet_page.dart';
import '../../classes/base/base.dart';
import '../../classes/meal_category/meal_category.dart';
import '../loading_dialog.dart';
import '../../pages/category_sheet.dart';
import '../../service/network/meal_service.dart';
import '../category_list_tile.dart';

class CategoryBlocks extends StatefulWidget {
  const CategoryBlocks({super.key});

  @override
  State<CategoryBlocks> createState() => _CategoryBlocksState();
}

class _CategoryBlocksState extends State<CategoryBlocks> {
  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mealService.fetchAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MealCategory> categories = snapshot.data!.categories;
          return Column(
            children: [
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        showLoadingDialog(context);
                        late Base meals;
                        try {
                          meals = await mealService
                              .fetchMealsByCategory(categories[index].strCategory);
                        } on SocketException {
                          context.pushReplacement(const NoInternetPage());
                        }
                        if (!mounted) return;
                        context.pop();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return DraggableScrollableSheet(
                              minChildSize: 0.2,
                              maxChildSize: 1,
                              expand: false,
                              builder: (oldContext, scrollController) {
                                return SingleChildScrollView(
                                  controller: scrollController,
                                  child: CategorySheet(
                                    imgUrl: categories[index].strCategoryThumb,
                                    description:
                                        categories[index].strCategoryDescription,
                                    category: categories[index].strCategory,
                                    meals: meals.meals,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CategoryListTile(
                          idCategory: categories[index].idCategory,
                          strCategory: categories[index].strCategory,
                          strCategoryThumb: categories[index].strCategoryThumb,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 160,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 300,
              height: 90,
              child: Column(
                children: const [
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
