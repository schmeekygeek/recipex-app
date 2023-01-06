import 'package:flutter/material.dart';
import 'package:recipex_app/providers/theme_model.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _offsetAnimation = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(0, -0.01),
    ).animate(_controller);

    _opacityAnimation = Tween<double>(
      begin: 0.1,
      end: 1,
    ).animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF5D4A7),
      padding: const EdgeInsets.all(18),
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "Ingredients that entice.",
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
        ),
      ),
    );
  }
}
