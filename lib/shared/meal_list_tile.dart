import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../service/ingredient_service.dart';
import 'meal_info_sheet.dart';
import '../classes/meals.dart';

class MealListTile extends StatefulWidget {
  final Meals meal;
  static const double iconSize = 13;
  static const double categorySize = 13;
  static const String itemTitleFont = "SpaceGrotesk";
  static const String itemSubtitleFont = "SpaceGrotesk";

  const MealListTile(this.meal, {super.key});

  @override
  State<MealListTile> createState() => _MealListTileState();
}

class _MealListTileState extends State<MealListTile>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealInfoSheet(
                    ingredients: buildIngredients(widget.meal),
                    meal: widget.meal),
              ),
            ),
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
                    child: AnimatedPadding(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      padding: const EdgeInsets.only(left: 18, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.meal.strMeal ?? "Unknown dish",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 28, letterSpacing: 1),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Origin: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.meal.strArea ?? "N/A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.lightBlue,
                                      ),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.meal.strCategory ?? "N/A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.lightBlue,
                                      ),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.meal.strTags
                                          ?.replaceAll(r',', ', ') ??
                                      "N/A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.lightBlue,
                                      ),
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
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.redAccent,
                  size: 22,
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Coming soon!!"),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.share,
                  color: Colors.blue,
                  size: 22,
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Coming soon!!"),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.solidFloppyDisk,
                  color: Colors.lightGreen,
                  size: 22,
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Coming soon!!"),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 9,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
