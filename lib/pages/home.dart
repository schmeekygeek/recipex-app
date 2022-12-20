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
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GNav(
            backgroundColor: const Color(0xff232634),
            style: GnavStyle.google,
            iconSize: 20,
            padding: const EdgeInsets.all(10),
            tabMargin: const EdgeInsets.all(8),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: context.watch<MealListProvider>().homePageIndex,
            gap: 8,
            onTabChange: (value) {
              pgController.animateToPage(
                value,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(
                  milliseconds: 500,
                ),
              );
            },
            tabs: [
              GButton(
                iconColor: Colors.grey,
                icon: FontAwesomeIcons.houseChimney,
                iconActiveColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                text: "Home",
                textStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: "SpaceGrotesk",
                  fontWeight: FontWeight.w600,
                ),
              ),
              GButton(
                iconColor: Colors.grey,
                icon: FontAwesomeIcons.magnifyingGlass,
                iconActiveColor: Colors.deepOrangeAccent,
                backgroundColor: Colors.orange.shade100,
                text: "Search",
                textStyle: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontFamily: "SpaceGrotesk",
                  fontWeight: FontWeight.w600,
                ),
              ),
              GButton(
                iconColor: Colors.grey,
                icon: FontAwesomeIcons.solidHeart,
                iconActiveColor: Colors.redAccent,
                backgroundColor: Colors.red.shade100,
                text: "Liked",
                textStyle: const TextStyle(
                  color: Colors.red,
                  fontFamily: "SpaceGrotesk",
                  fontWeight: FontWeight.w600,
                ),
              ),
              GButton(
                iconColor: Colors.grey,
                icon: FontAwesomeIcons.gear,
                iconActiveColor: Colors.blueAccent,
                backgroundColor: Colors.lightBlue.shade100,
                text: "Settings",
                textStyle: const TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: "SpaceGrotesk",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pgController,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (value) =>
            context.read<MealListProvider>().setHomePageIndex = value,
        reverse: false,
        children: const [Dashboard(), Search(), Liked(), Settings()],
      ),
    );
  }
}
