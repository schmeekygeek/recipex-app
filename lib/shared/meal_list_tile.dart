import 'package:flutter/material.dart';

import '../classes/meals.dart';

class MealListTile extends StatelessWidget {

  final Meals meal;
  static const double iconSize = 16;
  static const double categorySize = 15;

  const MealListTile(
    this.meal,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.yellowAccent.shade100,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        meal.strMeal!,
                        style: const TextStyle(
                          fontFamily: "PlayfairDisplay",
                          overflow: TextOverflow.clip,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.lightBlueAccent,
                            size: iconSize,
                          ),
                          Text(
                            meal.strArea!,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "AtkinsonHyperlegible",
                              fontSize: categorySize,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.category_sharp,
                            color: Colors.redAccent,
                            size: iconSize,
                          ),
                          Text(
                            meal.strCategory!,
                            style: const TextStyle(
                              fontFamily: "AtkinsonHyperlegible",
                              fontSize: categorySize,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(meal.strMealThumb!),
                      ),
                      shape: BoxShape.circle,
                    ),
                    height: 130,
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
