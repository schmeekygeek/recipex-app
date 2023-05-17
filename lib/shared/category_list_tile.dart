import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_model.dart';

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
    return Card(
      margin: const EdgeInsets.all(0),
      surfaceTintColor: context.watch<ThemeModel>().isDark ? Dark.base : White.surface0,
      color: context.watch<ThemeModel>().isDark ? Dark.base : Dark.text,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 130,
        child: Column(
          children: [
            Image.network(
              strCategoryThumb,
              colorBlendMode: BlendMode.dstATop,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 7,
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
                  fontFamily: 'Satoshi',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
