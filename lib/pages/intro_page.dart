import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/services.dart';

import '../pages/home.dart';
import '../providers/meal_list_provider.dart';
import './intro_pages/intro_page1.dart';
import './intro_pages/intro_page2.dart';
import './intro_pages/intro_page3.dart';
import './intro_pages/intro_page4.dart';

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
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

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
            onPageChanged: (value) => context.read<MealListProvider>().setCurrentPageIndex = value,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home(),)
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: context.watch<MealListProvider>().currentPageIndex % 2 == 0 ?
                  Colors.white
                  : Colors.black
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
