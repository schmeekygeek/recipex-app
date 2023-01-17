import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipex_app/providers/theme_model.dart';

class LikedBox extends StatelessWidget {
  const LikedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(4)
        ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LIKED RECIPES",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: White.text,
                          fontSize: 24,
                          fontFamily: "ClashGrotesk",
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "View your previously liked recipes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: White.text, fontSize: 17,),
                    ),
                  ],
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
        ],
      ),
    );
  }
}
