import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  // const FiltersScreen({ Key? key }) : super(key: key);
  static const routeName = 'filters-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('there you are at the filter screen'),
      ),
    );
  }
}
