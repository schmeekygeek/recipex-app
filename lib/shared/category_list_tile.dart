import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 130,
          decoration: BoxDecoration(
            color: Colors.amber.shade300,
            boxShadow: kElevationToShadow[4],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              tileMode: TileMode.mirror,
              colors: [
                Colors.amber.shade300,
                Colors.greenAccent.shade100
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  strCategoryThumb,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: White.text,
                    letterSpacing: 2
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
