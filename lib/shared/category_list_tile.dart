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
    return Container(
      padding: const EdgeInsets.all(20),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.45),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
          image: NetworkImage(
            strCategoryThumb,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          strCategory,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "Lora",
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
