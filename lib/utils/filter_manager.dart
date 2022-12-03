import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/data/filters_data.dart';
import '../models/meal.dart';

class FilterManager {
  List<Meal> get getFilteredMeals {
    var filteredMeals = DUMMY_MEALS.where(
      (element) {
        // return only Gluten-free meals if Gluten-free switch is on
        if (FILTER_SWITCH_TILE[0].filterState && !element.isGlutenFree) {
          return false;
        }

        // return only Lactose-free meals if Lactose-free switch is on
        if (FILTER_SWITCH_TILE[1].filterState && !element.isLactoseFree) {
          return false;
        }

        // return only Vegetarian meals if Vegetarian switch is on
        if (FILTER_SWITCH_TILE[2].filterState && !element.isVegetarian) {
          return false;
        }

        // return only Vegan meals if Vegan switch is on
        if (FILTER_SWITCH_TILE[3].filterState && !element.isVegan) {
          return false;
        }
        return true;
      },
    );
    return filteredMeals.toList();
  }
}
