import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../classes/meals/meals.dart';
import '../shared/loading_dialog.dart';
import '../classes/ingredient.dart';
import '../service/ingredient_service.dart';
import '../service/network/meal_service.dart';
import '../shared/meal_info_sheet.dart';
import '../shared/meal_list_tile.dart';

class CategorySheet extends StatefulWidget {
  final List<Meals> meals;
  final String category;
  final String description;
  final String imgUrl;

  const CategorySheet({
    super.key,
    required this.meals,
    required this.category,
    required this.description,
    required this.imgUrl,
  });

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends State<CategorySheet>
    with TickerProviderStateMixin {
  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.drag_handle,
              size: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  widget.category,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 40,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.description
              .replaceAll(
                RegExp(r'\[.\]'),
                '',
              )
              .split('.')[0],
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          for (Meals meal in widget.meals)
          GestureDetector(
            onTap: () async {
              showLoadingDialog(context);
              late final Meals mealData;
              try {
                mealData = await mealService.fetchMealById(meal.idMeal!);
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
              }
              if (mounted) {
                List<Ingredient> ingredients = buildIngredients(mealData);
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealInfoSheet(
                      ingredients: ingredients,
                      meal: mealData,
                    ),
                  ),
                );
              }
            },
            child: MealListTile(meal),
          ),
        ],
      ),
    );
  }
}
