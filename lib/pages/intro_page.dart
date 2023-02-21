import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/extensions.dart';

import 'login_page.dart';
import '../providers/theme_model.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  label: Text(
                    context.watch<ThemeModel>().isDark ?
                    "Light"
                    : "Dark"
                  ),
                  onPressed: () => context.read<ThemeModel>().toggle(),
                  icon: Icon(context.watch<ThemeModel>().isDark ?
                    FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidMoon
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontFamily: "LobsterTwo",
                      fontSize: 40,
                    ),
                child: AnimatedTextKit(
                  displayFullTextOnTap: true,
                  pause: const Duration(milliseconds: 1500),
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      "Quick",
                    ),
                    TyperAnimatedText(
                      "Delicious",
                    ),
                    TyperAnimatedText(
                      "Easy",
                    ),
                  ],
                ),
              ),
              Text(
                "recipes at your fingertips",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontFamily: "LobsterTwo",
                      fontSize: 40,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                "Cooking for your loved ones has never been easier.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.blueGrey,
                  fontFamily: "Satoshi",
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
              Center(
                child: LottieBuilder.asset(
                  "assets/girl-cooking.json",
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                label: const Text("Sign in"),
                icon: const Icon(
                  FontAwesomeIcons.arrowRightToBracket,
                ),
                onPressed: () => context.push(const LoginPage()),
                style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(17),
                  fixedSize: MaterialStatePropertyAll(
                    Size(double.maxFinite, 45),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FilledButton.icon(
                label: const Text("Register"),
                icon: const Icon(
                  FontAwesomeIcons.userPlus,
                ),
                onPressed: () => {},
                style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(17),
                  fixedSize: MaterialStatePropertyAll(
                    Size(double.maxFinite, 45),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FilledButton.icon(
                label: const Text("Continue as guest"),
                icon: const Icon(
                  FontAwesomeIcons.userSlash,
                ),
                onPressed: () => {},
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    White.text,
                  ),
                  iconSize: MaterialStatePropertyAll(17),
                  fixedSize: MaterialStatePropertyAll(
                    Size(double.maxFinite, 45),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.lime),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
