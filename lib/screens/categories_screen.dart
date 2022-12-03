import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Maximum width that it can take.
        childAspectRatio: 3 / 2, // 300 height and 200 width
        crossAxisSpacing: 20,
        mainAxisSpacing: 20, // Spacing of each item tile
      ),
      children: DUMMY_CATEGORIES
          .map((item) => CategoryItem(
                id: item.id,
                title: item.title,
                color: item.color,
              ))
          .toList(),
    );
  }
}
