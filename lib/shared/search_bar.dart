import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/meal_list_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  static final fieldTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 18,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: TextField(
              onSubmitted: (value) =>
                  context.read<MealListProvider>().setInput = value,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                letterSpacing: 1,
              ),
              controller: fieldTextController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "Search",
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                isDense: false,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => fieldTextController.clear(),
                icon: Icon(
                  FontAwesomeIcons.circleXmark,
                  size: 18,
                  color: Colors.redAccent.shade100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
