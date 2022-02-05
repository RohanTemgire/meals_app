import 'package:flutter/material.dart';


import '../models/meal.dart';
import '../widgets/meals_item.dart';

import '../dummy_data.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  // const CategoriesMealsScreen({ Key? key }) : super(key: key);
  late String categoryTitle;
  late List<Meal> displayedMeals;
  @override
  void initState() {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // categoryTitle = routeArgs['title'] as String;   //here we get an error cause initstate runs before our build method
    // // and now here as we require context but since our screen hasnt been initalized yet this is will throw an error
    // // now here didChangeDependences becomes handy
    // final categoryId = routeArgs['id'];

    // displayedMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title']
        as String; //here this will run only when our screen has been initalized
    final categoryId = routeArgs['id'];

    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
