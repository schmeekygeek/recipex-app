import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff316b63),
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            "The sky is the limit.",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "With recipes spanning 20+ categories,\nnever run out of meals to cook ever again.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
            overflow: TextOverflow.clip,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/intro/intro3.png",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
