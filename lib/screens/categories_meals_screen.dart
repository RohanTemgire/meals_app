import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_item.dart';

import '../dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  // const CategoriesMealsScreen({ Key? key }) : super(key: key);

  // final String categoryId;
  // final String CategoryTitle;
  //with this you can still pass data but this is fesible for small apps and not for huge apps
  // CategoriesMealsScreen(this.categoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
