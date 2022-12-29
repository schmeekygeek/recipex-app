import 'package:flutter/material.dart';

Widget metaData(BuildContext context, String attribute, String? detail) {
  return RichText(
    textAlign: TextAlign.left,
    text: TextSpan(
      children: [
        TextSpan(
          text: attribute,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color(0xfff8b400),
                // color: const Color(0xff6d9886),
                letterSpacing: 1
              ),
        ),
        TextSpan(
          text: detail?.replaceAll(RegExp(r','), ', ') ?? "N/A",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
