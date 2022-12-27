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
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 130,
          decoration: BoxDecoration(
            color: Colors.amber.shade300,
            gradient: LinearGradient(
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
                  strCategory,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: Colors.black87,
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
