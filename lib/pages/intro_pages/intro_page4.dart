
import 'package:flutter/material.dart';

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
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Easily like recipes to come back and view them later",
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.clip,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/intro/intro4.png",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
