import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../classes/meals.dart';
import '../../providers/storage_provider.dart';
import '../../providers/theme_model.dart';
import '../../service/ingredient_service.dart';
import '../meal_info_sheet.dart';

class ContinueBox extends StatefulWidget {
  const ContinueBox({super.key});

  @override
  State<ContinueBox> createState() => _ContinueBoxState();
}

class _ContinueBoxState extends State<ContinueBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealInfoSheet(
                  ingredients: buildIngredients(
                    context.watch<StorageProvider>().getLastMeal ?? Meals(),
                  ),
                  meal: context.watch<StorageProvider>().getLastMeal ?? Meals(),
                ),
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
                bottomRight: Radius.circular(4)
              ),
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
                          context.read<StorageProvider>().lastMeal?.strMealThumb ??
                              "none",
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
                        "CONTINUE READING",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Dark.text.withOpacity(0.6),
                          letterSpacing: 3,
                          fontFamily: "ClashGrotesk",
                          wordSpacing: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.read<StorageProvider>().lastMeal?.strMeal ?? "none",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Dark.text,
                          fontSize: 24,
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            FontAwesomeIcons.angleRight,
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
  }
}
