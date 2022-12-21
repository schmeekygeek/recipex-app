import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingSheet extends StatelessWidget {
  const LoadingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "One moment please..",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        LottieBuilder.asset(
          "assets/loading1.json",
          height: 200,
          frameRate: FrameRate.max,
        ),
      ],
    );
  }
}
