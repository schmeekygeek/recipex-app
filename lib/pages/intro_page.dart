
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/pages/home.dart';
import 'package:recipex_app/providers/theme_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                ListView(
                  children: [
                    AnimatedTextKit(
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
                          textStyle: Theme.of(context).textTheme.headlineMedium
                        ),
                        TypewriterAnimatedText(
                          "Quick",
                          speed: const Duration(
                            milliseconds: 100,
                          ),
                          textStyle: Theme.of(context).textTheme.headlineMedium
                        ),
                        TypewriterAnimatedText(
                          "Easy",
                          speed: const Duration(
                            milliseconds: 100,
                          ),
                          textStyle: Theme.of(context).textTheme.headlineMedium
                        ),
                      ],
                    ),
                    Text(
                      "recipes at your fingertips",
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Cooking for your loved ones has never felt easier before",
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
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
                ListView(
                  children: [
                    Text(
                      "From us,\nWith love",
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Find recipes with the best ingredients there is",
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 172,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
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
                ListView(
                  children: [
                    Text(
                      "The sky is the limit",
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "With recipes spanning 20+ categories, never run out of things to cook",
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
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
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.angleLeft),
                    onPressed: () => pageController.previousPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ),
                  SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 2,
                      dotHeight: 10,
                      dotWidth: 10,
                      strokeWidth: 1,
                      offset: 1,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.lightGreen
                    ),
                    controller: pageController,
                    count: 3,
                    textDirection: TextDirection.ltr,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.angleRight),
                    onPressed: () {
                      if(pageController.page == 2){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }
                      pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(1, -1),
              child: IconButton(
                icon: Icon(
                context.watch<ThemeModel>().isDark ?
                  FontAwesomeIcons.solidLightbulb :
                  Icons.dark_mode_rounded
                ),
                onPressed: () {
                  context.read<ThemeModel>().toggle();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
