import 'package:flutter/material.dart';
import 'package:recipex_app/providers/theme_model.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3>
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
      color: const Color(0xff316b63),
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
                "The sky is the limit.",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontFamily: "Lora", color: Dark.text),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "With recipes spanning 20+ categories,\nnever run out of meals to cook ever again.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Dark.text),
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
        ),
      ),
    );
  }
}
