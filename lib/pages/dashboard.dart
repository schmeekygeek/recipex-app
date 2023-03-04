import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'liked.dart';
import 'search.dart';
import '../providers/misc_provider.dart';
import '../shared/dashboard_widgets/recipe_otd.dart';
import '../providers/storage_provider.dart';
import '../shared/dashboard_widgets/continue_box.dart';
import '../shared/dashboard_widgets/category_blocks.dart';
import '../service/greeting_service.dart';
import '../shared/dashboard_widgets/liked_box.dart';
import '../shared/dashboard_widgets/search_box.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
            "${getGreeting()},",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 28,
                  color: Colors.grey,
                  fontWeight: FontWeight.w100,
                  fontFamily: "LobsterTwo",
                ),
          ),
          Text(
            "John",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  letterSpacing: 1,
                  fontSize: 40,
                  fontFamily: "Staatliches",
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "BROWSE CATEGORIES",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontFamily: "ClashGrotesk",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CategoryBlocks(),
          if (context.watch<StorageProvider>().getLastMealId != null)
            ContinueBox(
                lastMealId: context.watch<StorageProvider>().getLastMealId!),
          const RecipeOTDBox(),
          GestureDetector(
            onTap: () => context.read<MiscellaneousProvider>().setHomePage =
                const Liked(),
            child: const LikedBox(),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => context.read<MiscellaneousProvider>().setHomePage =
                const Search(),
            child: const SearchBox(),
          ),
        ],
      ),
    );
  }
}
