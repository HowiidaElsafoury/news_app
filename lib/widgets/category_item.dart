import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.categoryModel, required this.index, required this.onSelectedItem});
  final CategoryModel categoryModel;
  final int index;
  final VoidCallback? onSelectedItem;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onSelectedItem,
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.categoryColor,
          borderRadius: BorderRadius.only(
              topRight: const Radius.circular(25),
              topLeft: const Radius.circular(25),
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomRight:index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25 ), ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(categoryModel.categoryImage),
            Text(
              categoryModel.categoryTitle,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
