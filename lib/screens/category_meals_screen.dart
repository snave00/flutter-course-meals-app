import 'package:flutter/material.dart';
import 'package:meals_app/utils/filter_manager.dart';
import '../widgets/meal_item.dart';
import '../../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({
    super.key,
  });

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  /// Used for Navigator Push Only. This case is using Navigator PushNamed */
  // final String id;
  // final String title;
  String? categoryTitle;
  List<Meal>? filteredMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];

    filteredMeals = FilterManager().getFilteredMeals.where(
      (item) {
        return item.categories.contains(categoryId);
      },
    ).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      filteredMeals?.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'No title'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (itemBuilderContext, index) {
          return MealItem(
            id: filteredMeals![index].id,
            title: filteredMeals![index].title,
            imageUrl: filteredMeals![index].imageUrl,
            duration: filteredMeals![index].duration,
            complexity: filteredMeals![index].complexity,
            affordability: filteredMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: filteredMeals?.length,
      ),
    );
  }
}
