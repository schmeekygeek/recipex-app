import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../providers/theme_model.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(4)),
        gradient: const LinearGradient(colors: [
          Color(0xfff6f6c9),
          Color(0xff4fa095),
        ]),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SEARCH",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: White.text,
                          fontSize: 24,
                          fontFamily: "ClashGrotesk",
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Have something else in mind? Search for it!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: White.text, fontSize: 18),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    FontAwesomeIcons.angleRight,
                    size: 22,
                    color: White.text,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 20,
            bottom: 10,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.black.withOpacity(0.1),
              size: 160,
            ),
          ),
        ],
      ),
    );
  }
}
