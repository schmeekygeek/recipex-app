import 'package:flutter/material.dart';
import '../../providers/theme_model.dart';

class IntroPage4 extends StatefulWidget {
  const IntroPage4({super.key});

  @override
  State<IntroPage4> createState() => _IntroPage4State();
}

class _IntroPage4State extends State<IntroPage4>
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
      color: const Color(0xffFFBBB9),
      padding: const EdgeInsets.all(18.0),
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
                "See what you like?\nLike what you see",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontFamily: "Lora",
                      color: White.text,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Easily like recipes to come back and view them later",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: White.text),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    isAntiAlias: true,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/intro/intro4.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
