import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions.dart';
import '../../providers/theme_model.dart';
import '../../service/ingredient_service.dart';
import '../../service/network/meal_service.dart';
import '../meal_info_sheet.dart';

class ContinueBox extends StatefulWidget {
  final String lastMealId;
  const ContinueBox({super.key, required this.lastMealId});

  @override
  State<ContinueBox> createState() => _ContinueBoxState();
}

class _ContinueBoxState extends State<ContinueBox> {
  MealServiceImplementation mealService = MealServiceImplementation();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.push(
                    MealInfoSheet(
                      ingredients: buildIngredients(snapshot.data!),
                      meal: snapshot.data!,
                    ),
                  );
                },
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[4],
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(4),),
                  ),
                  child: Stack(
                    children: [
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        width: 220,
                        start: 130,
                        bottom: -100,
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data?.strMealThumb ?? 'none',
                              ),
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                Colors.black87.withOpacity(0.5),
                                BlendMode.dstATop,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CONTINUE READING',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Dark.text.withOpacity(0.6),
                                    letterSpacing: 3,
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                            ),
                            Text(
                              snapshot.data?.strMeal ?? 'Empty',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Dark.text,
                                    fontSize: 24,
                                  ),
                            ),
                            const Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  FontAwesomeIcons.anglesRight,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const SizedBox();
        }
        return const Text('hi');
      },
      future: mealService.fetchMealById(widget.lastMealId),
    );
  }
}
