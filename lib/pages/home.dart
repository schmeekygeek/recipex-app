import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../providers/meal_list_provider.dart';
import 'liked.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController pgController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.black87,
              child: GNav(
                backgroundColor: Colors.transparent,
                style: GnavStyle.google,
                iconSize: 20,
                padding: const EdgeInsets.all(10),
                tabMargin: const EdgeInsets.all(8),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                tabBackgroundColor: Colors.lightBlue.shade300,
                selectedIndex: context.watch<MealListProvider>().homePageIndex,
                gap: 8,
                color: Colors.grey,
                activeColor: Colors.black87,
                textStyle: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600, height: 1.2),
                onTabChange: (value) {
                  pgController.animateToPage(
                    value,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                  );
                },
                tabs: const [
                  GButton(
                    icon: FontAwesomeIcons.houseChimney,
                    text: "Home",
                  ),
                  GButton(
                    icon: FontAwesomeIcons.magnifyingGlass,
                    text: "Search",
                  ),
                  GButton(
                    icon: FontAwesomeIcons.solidHeart,
                    text: "Liked",
                  ),
                  GButton(
                    icon: FontAwesomeIcons.gear,
                    text: "Settings",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: pgController,
          physics: const AlwaysScrollableScrollPhysics(),
          onPageChanged: (value) =>
              context.read<MealListProvider>().setHomePageIndex = value,
          reverse: false,
          children: [
            Dashboard(
              controller: pgController,
            ),
            const Search(),
            const Liked(),
            const Settings(),
          ],
        ),
      ),
    );
  }
}
