import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/extensions.dart';
import 'package:recipex_app/shared/error_dialog.dart';
import 'package:recipex_app/shared/loading_dialog.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showLoadingDialog(context);
            try {
              await FirebaseAuth.instance.signOut();
              if(!mounted) return;
              context.pop();
            } on FirebaseAuthException catch(e) {
              print(e.code);
            } on SocketException {
              showErrorDialog(context, 'No internet connection');
            }
            if(!mounted) return;
            context.read<MiscellaneousProvider>().setHomePageIndex = 0;
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<MiscellaneousProvider>().getHomePageIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Liked',
              icon: Icon(
                FontAwesomeIcons.solidHeart,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                FontAwesomeIcons.solidUser,
                size: 20,
              ),
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
