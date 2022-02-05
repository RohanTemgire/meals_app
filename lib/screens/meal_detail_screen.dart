import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  // const MealDetailPage({ Key? key }) : super(key: key);

  final Function toggleFavorite;
  final Function isFavoriteMeal;

  MealDetailScreen(this.toggleFavorite, this.isFavoriteMeal);

  Widget buildSectionTitle(BuildContext context, title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    //firstwhere returns the element when it first finds the element and does not go further
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(meal.ingredients[index]),
                        ),
                      ),
                  itemCount: meal.ingredients.length),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealID),
        child: Icon(isFavoriteMeal(mealID)
            ? Icons.favorite
            : Icons.favorite_border_rounded),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pop(mealID);
      //   },
      //   child: Icon(Icons.delete),
      // ),
    );
  }
}
