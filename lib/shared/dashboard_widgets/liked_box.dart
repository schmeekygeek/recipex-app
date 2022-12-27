import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikedBox extends StatelessWidget {
  const LikedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.redAccent.shade100
          ]
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Liked Recipes",
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
            top: 5,
            left: 200,
            bottom: 10,
            child: Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.black.withOpacity(0.1),
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
