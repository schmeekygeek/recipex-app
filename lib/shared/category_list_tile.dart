
import 'dart:ui';

import 'package:flutter/material.dart';


class CategoryListTile extends StatelessWidget {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;

  const CategoryListTile({
    super.key,
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 100,
        width: 130,
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                    Colors.white.withOpacity(0.5),
                  ]
                )
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 40,
                sigmaX: 40
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      strCategoryThumb,
                      colorBlendMode: BlendMode.dstATop,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      strCategory.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        fontFamily: 'Cabinet',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
