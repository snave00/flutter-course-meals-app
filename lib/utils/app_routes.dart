import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tab_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_detail_screen.dart';

/// Custom Made by Evanson */
class AppRoutes {
  /// Screen Routes Endpoints */
  static const String initialRoute = '/';
  static const String categoryMealsScreenRoute = '/category-meals';
  static const String mealDetailScreenRoute = '/meal-detail';
  static const String filtersScreenScreenRoute = '/filters';

  /// Screen Routes */
  static Map<String, Widget Function(BuildContext)> get getRoutes {
    return {
      initialRoute: (routeContext) => const TabScreen(),
      categoryMealsScreenRoute: (routeContext) => const CategoryMealsScreen(),
      mealDetailScreenRoute: (routeContext) => const MealDetailScreen(),
      filtersScreenScreenRoute: (routeContext) => const FiltersScreen(),
    };
  }

  /// Navigation Routes */
  static void goToInitialScreen(final BuildContext context) {
    Navigator.of(context).pushReplacementNamed(initialRoute);
  }

  static void goToCategoryMealsScreen(
    final BuildContext context,
    final String id,
    final String title,
  ) {
    Navigator.of(context).pushNamed(categoryMealsScreenRoute, arguments: {
      'id': id,
      'title': title,
    });

    /** Using Navigator Push */
    // Navigator.of(context).push(MaterialPageRoute(builder: (buildContext) {
    //   return CategoryMealsScreen(id: id, title: title);
    // }));
  }

  static void goToMealItemScreen({
    required final BuildContext context,
    final String? id,
    Function? removeItem,
  }) {
    Navigator.of(context)
        .pushNamed(mealDetailScreenRoute, arguments: id)
        // Returns the value from MealDetailScreen if popped.
        .then((value) => {
              if (value != null) {removeItem!(value)}
            });
  }

  static void goToFiltersScreen({
    required BuildContext context,
  }) {
    Navigator.of(context).pushReplacementNamed(
      filtersScreenScreenRoute,
    );
  }
}
