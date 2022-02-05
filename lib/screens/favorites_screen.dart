import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_item.dart';


class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('There are no Favorite meals yet - Add them!'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
