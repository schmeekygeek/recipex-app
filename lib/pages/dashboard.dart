import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:recipex_app/classes/base.dart';

import '../service/greeting_service.dart';
import '../classes/meal_category.dart';
import '../service/meal_service.dart';
import '../shared/category_list_tile.dart';
import '../shared/dashboard_widgets/liked_box.dart';
import '../shared/dashboard_widgets/search_box.dart';
import 'category_sheet.dart';

class Dashboard extends StatefulWidget {
  final PageController controller;
  const Dashboard({super.key, required this.controller});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            "${getGreeting()},\nMaria",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              letterSpacing: 1,
              fontSize: 40,
              fontFamily: "Satoshi",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Categories",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 25,
                  fontFamily: "ClashGrotesk",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: fetchAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MealCategory> categories = snapshot.data!.categories;
                return SizedBox(
                  height: 160,
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
                            meals = await fetchMealsByCategory(
                                categories[index].strCategory);
                          } catch (e) {
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
                                      Text(
                                        "Please check your internet connection and try again",
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
                                      imgUrl:
                                          categories[index].strCategoryThumb,
                                      description: categories[index]
                                          .strCategoryDescription,
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
                  height: 160,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.redAccent.shade100,
                      size: 30,
                    ),
                    const SizedBox(width: 4,),
                    Expanded(
                      child: Text(
                        "You do not have an internet connection.",
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  overflow: TextOverflow.clip
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                );
              }
            },
          ),
          GestureDetector(
            onTap: () => widget.controller.animateToPage(
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
            onTap: () => widget.controller.animateToPage(
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
