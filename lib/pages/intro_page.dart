import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/pages/home.dart';
import 'package:recipex_app/pages/intro_pages/intro_page1.dart';
import 'package:recipex_app/pages/intro_pages/intro_page3.dart';
import 'package:recipex_app/pages/intro_pages/intro_page4.dart';
import 'package:recipex_app/providers/meal_list_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_pages/intro_page2.dart';

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
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) =>
                {context.read<MealListProvider>().setCurrentPageIndex = value},
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(
              bottom: 30
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    if (context.read<MealListProvider>().currentPageIndex ==
                        0) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    } else {
                      pageController.previousPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    foregroundColor: const MaterialStatePropertyAll(Color(0xff313244)),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xfff5e0dc),
                    ),
                    side: const MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                        width: 1,
                        color: Color(0xff242832),
                      ),
                    ),
                  ),
                  child: Text(
                    context.watch<MealListProvider>().currentPageIndex == 0
                        ? " Skip "
                        : "Previous",
                  ),
                ),
                SmoothPageIndicator(
                  effect: const WormEffect(
                    activeDotColor: Colors.deepPurpleAccent,
                    dotWidth: 10,
                    dotHeight: 10,
                    strokeWidth: 1,
                    offset: 1,
                  ),
                  controller: pageController,
                  count: 4,
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
                TextButton(
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                        foregroundColor: const MaterialStatePropertyAll(Color(0xff313244)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xfff5e0dc)),
                    side: const MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                        width: 1,
                        color: Color(0xff242832),
                      ),
                    ),
                      ),
                  onPressed: () {
                    if (pageController.page == 3) {
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
                  child: Text(
                    context.watch<MealListProvider>().currentPageIndex == 3
                        ? " Get started "
                        : "  Next  ",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
