import 'package:flutter/material.dart';

Widget metaData(BuildContext context, String attribute, String? detail) {
  return RichText(
    textAlign: TextAlign.left,
    text: TextSpan(
      children: [
        TextSpan(
          text: attribute,
          style: Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
            color: Colors.blueGrey,
            fontSize: 20,
          ),
        ),
        TextSpan(
          text: detail?.replaceAll(RegExp(r','), ', ') ?? 'N/A',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
        ),
      ],
    ),
  );
}
