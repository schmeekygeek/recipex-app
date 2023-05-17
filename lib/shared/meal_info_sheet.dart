import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../extensions.dart';
import 'confirm_pass_sheet.dart';
import 'error_dialog.dart';
import 'loading_dialog.dart';
import '../classes/meals/meals.dart';
import '../providers/storage_provider.dart';
import '../providers/theme_model.dart';
import '../service/metadata.dart' as mymeta;
import '../classes/ingredient.dart';

class MealInfoSheet extends StatefulWidget {
  final Meals meal;
  final List<Ingredient> ingredients;
  const MealInfoSheet({
    required this.ingredients,
    required this.meal,
    super.key,
  });

  @override
  State<MealInfoSheet> createState() => _MealInfoSheetState();
}

class _MealInfoSheetState extends State<MealInfoSheet> {
  @override
  void initState() {
    context.read<StorageProvider>().setLastMealId(widget.meal.idMeal!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.solidHeart,
                  ),
                  onPressed: () async {
                    showLoadingDialog(context);
                    bool didLike = false;
                    try {
                      didLike =
                          await mealService.likeRecipe(widget.meal.getMealId);
                    } 
                    on FirebaseException {
                      context.pop();
                      showErrorDialog(context, 'Something went wrong');
                      return;
                    } catch (e) {
                      context.pop();
                      showErrorDialog(context, 'Something went wrong');
                      return;
                    }
                    if (!mounted) return;
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          didLike
                              ? 'Successfully liked recipe'
                              : 'Removed from liked recipes',
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    context.watch<ThemeModel>().isDark
                        ? FontAwesomeIcons.solidLightbulb
                        : Icons.dark_mode_rounded,
                  ),
                  onPressed: () => context.read<ThemeModel>().toggle(),
                ),
              ],
              automaticallyImplyLeading: true,
              expandedHeight: 250,
              title: null,
              titleTextStyle:
                  Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
              iconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
              stretch: true,
              titleSpacing: 2,
              elevation: 10,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                  widget.meal.strMealThumb!,
                  fit: BoxFit.cover,
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.55),
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.dstATop,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.meal.strMeal ?? 'Unknown',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    widget.meal.strArea != null ? mymeta.MetaData(
                      origin: widget.meal.strArea!,
                      category: widget.meal.strCategory ?? 'N/A',
                      tags: widget.meal.strTags ?? 'N/A',
                    ) : const SizedBox(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients  ',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Icon(
                          FontAwesomeIcons.carrot,
                          color: Colors.red.shade300,
                          size: 28,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (Ingredient ingredient in widget.ingredients)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              ingredient.ingredient,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              ingredient.measure,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Instructions  ',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Icon(
                          FontAwesomeIcons.bowlRice,
                          color: Colors.lightGreen,
                          size: 28,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.meal.strInstructions ??
                          'No instructions available for this recipe',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
