import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/theme_model.dart';

import '../providers/meal_list_provider.dart';
import 'liked.dart';
import 'dashboard.dart';
import 'profile.dart';
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
                tabBackgroundColor: const Color(0xfff2d388),
                selectedIndex: context.watch<MealListProvider>().homePageIndex,
                gap: 8,
                color: Colors.grey,
                activeColor: White.text,
                textStyle: const TextStyle(
                  color: White.text,
                  // color: Color(0xffa7d2cb),
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
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
                    icon: FontAwesomeIcons.solidUser,
                    text: "Profile",
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
            const Profile(),
          ],
        ),
      ),
    );
  }
}
