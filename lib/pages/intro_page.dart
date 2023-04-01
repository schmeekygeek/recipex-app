import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'signup_page.dart';
import '../extensions.dart';
import 'login_page.dart';
import '../providers/theme_model.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> 
  with TickerProviderStateMixin {

  late AnimationController _controller;
  late Tween _tween;

  @override
  void initState() {

    _tween = Tween<double>(
      begin: 0.9,
      end: 1
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600
      ),
    );

    _tween.animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FadeTransition(
          opacity: _controller,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    label: Text(
                      context.watch<ThemeModel>().isDark ? "Light" : "Dark",
                    ),
                    onPressed: () => context.read<ThemeModel>().toggle(),
                    icon: Icon(
                      context.watch<ThemeModel>().isDark
                          ? FontAwesomeIcons.lightbulb
                          : FontAwesomeIcons.solidMoon,
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 45,
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
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 45,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Cooking for your loved ones has never been easier.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.blueGrey,
                      fontFamily: "Satoshi",
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: LottieBuilder.asset(
                      "assets/intro-girl-cooking.json",
                      width: 500,
                      height: 500,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  label: const Text("Sign in"),
                  icon: const Icon(
                    FontAwesomeIcons.arrowRightToBracket,
                  ),
                  onPressed: () => context.push(const LoginPage()),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    iconSize: const MaterialStatePropertyAll(17),
                    fixedSize: const MaterialStatePropertyAll(
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
                  onPressed: () => context.push(const SignUp()),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    iconSize: const MaterialStatePropertyAll(17),
                    fixedSize: const MaterialStatePropertyAll(
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
                  style: ButtonStyle(
                    foregroundColor: const MaterialStatePropertyAll(
                      White.text,
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    iconSize: const MaterialStatePropertyAll(17),
                    fixedSize: const MaterialStatePropertyAll(
                      Size(
                        double.maxFinite,
                        45,
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.lime,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
