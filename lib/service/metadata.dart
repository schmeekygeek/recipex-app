import 'package:flutter/material.dart';

Widget metaData(BuildContext context, String attribute, String? detail) {
  detail = detail?.replaceAll(RegExp(r', '), ',') ?? 'N/A';
  detail = detail.replaceAll(RegExp(r','), ', ');
  return RichText(
    textAlign: TextAlign.left,
    text: TextSpan(
      children: [
        TextSpan(
          text: attribute,
          style: Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        TextSpan(
          text: detail,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
        ),
      ],
    ),
  );
}
