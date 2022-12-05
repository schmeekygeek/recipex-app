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
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget> [
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(42)
              )
            ),
            onSubmitted: (value) async {
              if(!mounted) return;
              context.read<MealListProvider>().setInput = value;
            },
            onEditingComplete: () => {},
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
