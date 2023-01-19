import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
    builder: (context) => Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Center(
          child: LottieBuilder.asset(
            "assets/loading1.json",
            height: 150,
            frameRate: FrameRate.max,
          ),
        ),
      ),
    ),
    context: context,
  );
}
