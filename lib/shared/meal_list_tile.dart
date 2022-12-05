import 'package:flutter/material.dart';

import '../classes/meals.dart';

class MealListTile extends StatelessWidget {

  final Meals meal;

  const MealListTile(
    this.meal,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meal.getMeal),
      subtitle: Text(meal.getMealId),
    );
  }
}
