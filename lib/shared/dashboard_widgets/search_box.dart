import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.blue.shade800,
          ]
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Looking for something specific?\nSearch it.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    FontAwesomeIcons.angleRight,
                    size: 22,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 200,
            bottom: 10,
            child: Icon(
              FontAwesomeIcons.magnifyingGlassArrowRight,
              color: Colors.black.withOpacity(0.1),
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
