import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/no-internet.json",
              height: 250,
              frameRate: FrameRate.max,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ohhh snap...",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontFamily: "Staatliches",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You do not seem to have an internet connection\n please try again later",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: "Staatliches",
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop', false),
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
              child: const Text(
                "Got it",
                style: TextStyle(
                  fontFamily: "ClashGrotesk",
                  letterSpacing: 1
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
