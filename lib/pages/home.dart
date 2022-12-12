import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../providers/meal_list_provider.dart';
import 'bookmarks.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pgController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: GNav(
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: "SpaceGrotesk",
          ),
          style: GnavStyle.google,
          iconSize: 20,
          activeColor: Colors.black87,
          tabBackgroundColor: Colors.black87,
          padding: const EdgeInsets.all(8),
          tabMargin: const EdgeInsets.all(8),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          selectedIndex: context.watch<MealListProvider>().pageIndex,
          gap: 8,
          onTabChange: (value) {
            pgController.animateToPage(
              value,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 500),
            );
          },
          tabs: [
            GButton(
              iconColor: Colors.grey,
              icon: FontAwesomeIcons.house,
              iconActiveColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple.shade100,
              text: "Home",
              textStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: "SpaceGrotesk",
                  fontWeight: FontWeight.w600),
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
                  fontWeight: FontWeight.w600),
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
                  fontWeight: FontWeight.w600),
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
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pgController,
        onPageChanged: (value) =>
            context.read<MealListProvider>().setIndex = value,
        reverse: false,
        children: const [Dashboard(), Search(), Liked(), Settings()],
      ),
    );
  }
}
