import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     // initialIndex: 1,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Meals'),
  //         bottom: TabBar(
  //           tabs: [
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Categories',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.favorite),
  //               text: 'Favorites',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: [CategoriesScreen(), FavoritesScreen()],
  //       ),
  //     ),
  //   );
  // }

  // for bottom navigationbar
  List<Map<String, Object>> _pages = [
    {'pages': CategoriesScreen(), 'title': 'Categories'},
    {'pages': FavoritesScreen(), 'title': 'Favorites'},
  ];
  int _pageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_pageIndex]['pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _pageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        // now here for shifting the above mention styles does not work so we have to set styles inside items
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favorites')
        ],
      ),
    );
  }
}
