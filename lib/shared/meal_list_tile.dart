import 'package:flutter/material.dart';

import '../classes/meals/meals.dart';
import '../service/metadata.dart';

class MealListTile extends StatefulWidget {
  final Meals meal;
  const MealListTile(this.meal, {super.key});

  @override
  State<MealListTile> createState() => _MealListTileState();
}

class _MealListTileState extends State<MealListTile>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void initState() {

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    _tween = Tween(
      begin: 1,
      end: 1
    );
    _tween.animate(_controller);
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 14,
          left: 10,
          right: 10,
          bottom: 14,
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
                        style:
                            Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontSize: 30,
                                  fontFamily: "ClashGrotesk",
                                  letterSpacing: 1,
                                ),
                      ),
                      widget.meal.strArea != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                metaData(
                                  context,
                                  "Origin: ",
                                  widget.meal.strArea,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                metaData(
                                  context,
                                  "Category: ",
                                  widget.meal.strCategory,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                metaData(
                                  context,
                                  "Tags: ",
                                  widget.meal.strTags,
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
