import 'package:flutter/material.dart';
import 'package:recipex_app/providers/theme_model.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF5D4A7),
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text("Ingredients that entice.",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontFamily: "Lora",
              color: White.text,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Cook recipes with ingredients that leave you asking for more.",
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: White.text,
              ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/intro/intro2.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
