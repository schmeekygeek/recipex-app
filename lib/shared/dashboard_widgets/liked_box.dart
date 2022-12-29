import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipex_app/providers/theme_model.dart';

class LikedBox extends StatelessWidget {
  const LikedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xffffcaca),
            Color(0xffff8787),
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
                  "Liked recipes",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: White.text,
                        fontSize: 24
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
