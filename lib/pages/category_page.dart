import 'package:flutter/material.dart';
import 'package:recipex_app/classes/meals.dart';
import 'package:recipex_app/service/meal_service.dart';
import 'package:recipex_app/shared/meal_list_tile.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.category),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    return Column(
                      children: [
                        for(Meals meal in snapshot.data!.meals) 
                        GestureDetector(
                          onTap: () {
                            // TODO implement fetch meal by id
                          },
                          child: MealListTile(meal),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
                future: fetchMealsByCategory(widget.category),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
