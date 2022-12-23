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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            strCategoryThumb,
            height: 100,
          ),
        ),
        Text(
          strCategory,
        ),
      ]
    );
  }
}
