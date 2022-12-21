import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_model.dart';

class Liked extends StatelessWidget {
  const Liked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              "LIKED RECIPES",
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                  Image.asset(
                    context.watch<ThemeModel>().isDark ? 
                    "assets/girl-cycle-dark.png" :
                    "assets/girl-cycle-light.png",
                    height: 150,
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Once you like a recipe, we'll show it here",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
