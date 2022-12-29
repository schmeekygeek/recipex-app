import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:recipex_app/providers/theme_model.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff242832),
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Dark.text,
              fontFamily: "Lora",
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(
                milliseconds: 500,
              ),
              animatedTexts: [
                TypewriterAnimatedText(
                  "Delicious",
                  speed: const Duration(
                    milliseconds: 50,
                  ),
                ),
                TypewriterAnimatedText(
                  "Quick",
                  speed: const Duration(
                    milliseconds: 100,
                  ),
                ),
                TypewriterAnimatedText(
                  "Easy",
                  speed: const Duration(
                    milliseconds: 100,
                  ),
                ),
              ],
            ),
          ),
          Text("recipes at your fingertips.",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Dark.text,
              fontFamily: "Lora",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Cooking for your loved ones has never been this easy before.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Dark.text
            ),
            overflow: TextOverflow.clip,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/intro/intro1.png",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
