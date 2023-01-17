import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../classes/base.dart';
import '../../classes/meal_category.dart';
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
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    showDialog(
                      builder: (context) => Dialog.fullscreen(
                        backgroundColor: Colors.transparent,
                        child: LottieBuilder.asset(
                          "assets/loading1.json",
                          height: 200,
                          frameRate: FrameRate.max,
                        ),
                      ),
                      context: context,
                    );
                    late Base meals;
                    try {
                      meals = await mealService.fetchMealsByCategory(
                          categories[index].strCategory);
                    } on SocketException {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.triangleExclamation,
                                  color: Colors.redAccent,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "Please check your internet connection and try again",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      return;
                    }
                    if (!mounted) return;
                    Navigator.of(context).pop();
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
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 160,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Icon(
            FontAwesomeIcons.xmark,
            color: Colors.redAccent.shade100,
            size: 30,
          );
        }
      },
    );
  }
}
