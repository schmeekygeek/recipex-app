import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  final String text;
  final IconData icon;
  const SettingsTitle({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.blueGrey,
              // color: Colors.blueGrey,
              size: 18,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Satoshi',
                color: Colors.blueGrey,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
