import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'liked.dart';
import 'profile.dart';
import 'search.dart';
import 'dashboard.dart';
import '../providers/misc_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static final List<Widget> _homeWidgets = [
    const Dashboard(),
    const Search(),
    const Liked(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<MiscellaneousProvider>().getHomePageIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Liked",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.verified_user),
            ),
          ],
          onTap: (value) {
            context.read<MiscellaneousProvider>().setHomePageIndex = value;
          },
        ),
        body: _homeWidgets[context.watch<MiscellaneousProvider>().getHomePageIndex],
      ),
    );
  }
}
