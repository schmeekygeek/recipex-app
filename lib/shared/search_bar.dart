import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/meal_list_provider.dart';
import '../providers/theme_model.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  static final fieldTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextField(
          onSubmitted: (value) => context.read<MealListProvider>().setInput = value,
          style: const TextStyle(
            fontFamily: "SpaceGrotesk",
            color: Colors.black87,
          ),
          controller: fieldTextController,
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 18,
                color: Colors.amber,
              ),
            ),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.black87,
              fontFamily: "SpaceGrotesk",
            ),
            isDense: false,
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: IconButton(
                onPressed: () => fieldTextController.clear(),
                icon: Icon(
                  FontAwesomeIcons.circleXmark,
                  size: 18,
                  color: Colors.redAccent.shade100,
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            hoverColor: Colors.transparent,
            focusedBorder: InputBorder.none,
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
