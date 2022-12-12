import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/ingredient_service.dart';
import '../providers/theme_model.dart';
import 'meal_info_sheet.dart';
import '../classes/meals.dart';

class MealListTile extends StatefulWidget {

  final Meals meal;
  static const double iconSize = 16;
  static const double categorySize = 16;
  static const String itemTitleFont = "SpaceGrotesk";
  static const String itemSubtitleFont = "SpaceGrotesk";

  const MealListTile(this.meal, {super.key});

  @override
  State<MealListTile> createState() => _MealListTileState();
}

class _MealListTileState extends State<MealListTile> with TickerProviderStateMixin {

  @override
  void dispose() {
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealInfoSheet(ingredients: buildIngredients(widget.meal), meal: widget.meal),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Container(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.meal.strMealThumb!,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.meal.strMeal ?? "N/A",
                            style: const TextStyle(
                                fontSize: 23,
                                fontFamily: "Quincy",
                                fontWeight: FontWeight.w400),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Origin: ",
                                  style: TextStyle(
                                      height: 1.5,
                                      color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
                                      fontFamily: MealListTile.itemTitleFont,
                                      fontSize: MealListTile.categorySize,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.meal.strArea ?? "N/A",
                                  style: TextStyle(
                                      color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
                                      fontFamily: MealListTile.itemTitleFont,
                                      fontSize: MealListTile.categorySize,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Category: ",
                                  style: TextStyle(
                                      height: 1.5,
                                      color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
                                      fontFamily: MealListTile.itemTitleFont,
                                      fontSize: MealListTile.categorySize,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.meal.strCategory ?? "N/A",
                                  style: TextStyle(
                                      color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
                                      fontFamily: MealListTile.itemTitleFont,
                                      fontSize: MealListTile.categorySize,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Tags: ",
                                  style: TextStyle(
                                      height: 1.5,
                                      color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
                                      fontFamily: MealListTile.itemTitleFont,
                                      fontSize: MealListTile.categorySize,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.meal.strTags?.replaceAll(r',', ', ') ??
                                      "N/A",
                                  style: TextStyle(
                                      color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
                                      fontFamily: MealListTile.itemTitleFont,
                                      fontSize: MealListTile.categorySize,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 9,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
