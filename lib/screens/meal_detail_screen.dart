import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  // const MealDetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    // final id = mealID['id'] ;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealID'),
      ),
      body: Center(
        child: Text('this is the id for the selected meal $mealID'),
      ),
    );
  }
}
