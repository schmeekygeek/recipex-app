import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {

  push(Widget destination) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (_) => destination,
      ),
    );
  }

  pop() {
    Navigator.of(this).pop();
  }

  pushReplacement(Widget destination) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (_) => destination,
      ),
    );
  }
}
