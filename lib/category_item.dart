import 'package:flutter/material.dart';
import './categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({ Key? key }) : super(key: key);
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //this can be a lot hectic while you have a huge app, which is why we use the "NamedRoutes" to navigate through pages
    //     builder: (_) {
    //       return CategoriesMealsScreen(id,title);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      enableFeedback: true,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
