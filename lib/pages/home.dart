import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/pages/bookmarks.dart';

import '../providers/meal_list_provider.dart';
import 'dashboard.dart';
import 'search.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pgController = PageController(
    initialPage: 0,
    keepPage: true
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GNav(
        gap: 0,
        tabs:  [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.search,
            text: "Search",
          ),
          // GButton(
          //   icon: Icons.bookmark,
          //   text: "Bookmarks",
          // ),
          GButton(
            icon: Icons.settings,
            text: "Settings",
          ),
        ],
      ),
      body: PageView(
        controller: pgController,
        onPageChanged: (value) => context.read<MealListProvider>().setIndex = value,
        reverse: false,
        children: const [
          Dashboard(),
          Search(),
          // Bookmarks(),
          Settings()
        ],
      ),
    );
  }
}
