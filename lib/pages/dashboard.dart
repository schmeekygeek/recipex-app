import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/misc_provider.dart';
import '../shared/dashboard_widgets/recipe_otd.dart';
import '../providers/storage_provider.dart';
import '../shared/dashboard_widgets/continue_box.dart';
import '../shared/dashboard_widgets/category_blocks.dart';
import '../service/greeting_service.dart';
import '../shared/dashboard_widgets/liked_box.dart';
import '../shared/dashboard_widgets/search_box.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween _tween;

  @override
  void initState() {
    _tween = Tween<double>(begin: 0.9, end: 1);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    _tween.animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _controller,
      axis: Axis.vertical,
      axisAlignment: -0.95,
      child: FadeTransition(
        opacity: _controller,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                '${getGreeting()},',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 28,
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'LobsterTwo',
                    ),
              ),
              Text(
                FirebaseAuth.instance.currentUser?.displayName ?? 'guest',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      letterSpacing: 1,
                      fontSize: 40,
                      fontFamily: 'Staatliches',
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'CATEGORIES',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17,
                      fontFamily: 'Satoshi',
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
              ),
              const SizedBox(
                height: 11,
              ),
              const CategoryBlocks(),
              if (context.watch<StorageProvider>().getLastMealId != null)
                ContinueBox(
                  lastMealId: context.watch<StorageProvider>().getLastMealId!,
                ),
              const RecipeOTDBox(),
              GestureDetector(
                onTap: () =>
                    context.read<MiscellaneousProvider>().setHomePageIndex = 2,
                child: const LikedBox(),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    context.read<MiscellaneousProvider>().setHomePageIndex = 1,
                child: const SearchBox(),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
