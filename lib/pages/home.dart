import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      const Dashboard(),
      const Search(),
      const Settings()
    ];
    return Scaffold(
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          context.read<MealListProvider>().setIndex = value;
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            gap: 5,
            text: "Home",
          ),
          GButton(
            icon: Icons.search,
            gap: 5,
            text: "Search",
          ),
          GButton(
            icon: Icons.settings,
            gap: 5,
            text: "Settings",
          ),
        ],
      ),
      body: widgets[context.watch<MealListProvider>().pageIndex],
    );
  }
}
