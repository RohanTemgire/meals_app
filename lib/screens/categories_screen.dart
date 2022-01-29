import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fav Meals"),
      ),
      body: GridView(
        //here GridView has a .builder function too where you use that for performance improvement such that you render only few list items
        //and not all.
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catdata) =>
                  CategoryItem(catdata.id, catdata.title, catdata.color),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            childAspectRatio: 2.5 / 2),
      ),
      // bottomNavigationBar: Text('this is bottom navigator bar'),
    );
  }
}
