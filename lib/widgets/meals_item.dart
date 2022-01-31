import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealsItem extends StatelessWidget {
  // const MealsItem({Key? key}) : super(key: key);
  final id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealsItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  get complexityText {
    // if(complexity == Complexity.Simple){
    //   return 'Simple';
    // }
    // if(complexity == Complexity.Hard){
    //   return 'Hard';
    // }
    // if(complexity == Complexity.Challenging){
    //   return 'Challenging';
    // }
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        'Unknown';
    }
  }

  get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        'Unknown';
    }
  }

  void selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 10),
                      Text('${duration.toString()} mins'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 10),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_rounded),
                      SizedBox(width: 10),
                      Text('$affordabilityText'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
