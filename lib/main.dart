import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

//just for checking

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fav Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', //default is '/'
      routes: {
        '/': (context) =>
            TabsScreen(), //this can also be used instead of using the above method for home routing
        // '/category-meals': (ctx) => CategoriesMealsScreen(),
        //here there can be spelling errors and bc of that error your app can break so there is another way producing the same output
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },

      // onGenerateRoute: (settings) {
      //this is a useull method when you have a highly flexible app and then you might miss to mention route,
      //in such cases this 'onGenerateRoute' will help you such that if you do not mention any routes in the routes list, then this method will run
      //   print(settings);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },

      onUnknownRoute:
          (settings) => //now this function here will excute if your app fails to load from the given routes list, and from onGenerateRoute
              // this function is the last opt for flutter to show something on the screen if anything fails, or your app crashes.
              MaterialPageRoute(builder: (ctx) => CategoriesScreen()),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fav Meals'),
//       ),
//       body: Center(
//         child: const Text('Navigation Time!'),
//       ),
//     );
//   }
// }
