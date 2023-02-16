import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 25),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, box) {
          return Stack(
            fit: StackFit.expand,
            children: [
              LottieBuilder.asset(
                "assets/moving-shape-orange.json",
                controller: _controller,
                height: 300,
                width: 300,
                repeat: true,
                frameRate: FrameRate.max,
              ),
              LottieBuilder.asset(
                "assets/moving-hexagon.json",
                controller: _controller,
                height: 300,
                width: 200,
                repeat: true,
                frameRate: FrameRate.max,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: box.maxHeight / 6, left: 12, right: 12, bottom: 12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80,
                    sigmaY: 80,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
