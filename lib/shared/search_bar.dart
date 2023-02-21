import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/theme_model.dart';
import '../providers/meal_list_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  static final TextEditingController fieldTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: TextField(
              onSubmitted: (value) =>
                  context.read<MealListProvider>().setInput = value,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                    color: White.crust,
                  ),
              controller: fieldTextController,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.zero,
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
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () => fieldTextController.clear(),
                icon: const Icon(
                  FontAwesomeIcons.circleXmark,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xffa7d2cb),
                  ),
                ),
                onPressed: () => context.read<MealListProvider>().setInput =
                    fieldTextController.text,
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 18,
                  color: Dark.base,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
