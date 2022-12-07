import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/meal_list_provider.dart';
import 'package:recipex_app/service/meal_service.dart';
import 'package:recipex_app/shared/meal_list_tile.dart';

import '../classes/meals.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: ListView(
        children: <Widget> [
          const SizedBox(
            height: 12,
          ),
          const Text(
            "What do you want to cook today?",
            style: TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 45,
            child: TextField(
              selectionHeightStyle: BoxHeightStyle.tight,
              decoration: const InputDecoration(
                fillColor: Colors.blueGrey,
                hintText: "Search",
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(18, 0, 8, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.amberAccent,
                  ),
                ),
                hintStyle: TextStyle(
                  fontFamily: "SpaceMono",
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                    style: BorderStyle.solid,
                    strokeAlign: StrokeAlign.center
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  // gapPadding: 1
                ),
              ),
              onSubmitted: (value) async {
                if(!mounted) return;
                context.read<MealListProvider>().setInput = value;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              List<Meals> meals = snapshot.data!.meals;
              return Column(
                children: [
                  for(Meals meal in meals) MealListTile(meal),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
          future: execute(context.watch<MealListProvider>().input),
          ),
        ],
      ),
    );
  }
}
