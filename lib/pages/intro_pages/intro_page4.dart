
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipex_app/providers/theme_model.dart';

import '../home.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFBBB9),
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            "See what you like?\nLike what you see",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontFamily: "Lora",
              color: White.text,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Easily like recipes to come back and view them later",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: White.text
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/intro/intro4.png",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
