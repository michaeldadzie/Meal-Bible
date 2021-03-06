import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mealsapp/screens/profile_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen()},
      {'page': FavoriteScreen(widget.favoriteMeals)},
      {'page': ProfileScreen()},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget get menuButton {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 3, width: 24, color: Theme.of(context).hoverColor),
          SizedBox(height: 5),
          Container(height: 3, width: 12, color: Theme.of(context).hoverColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      // drawer: Drawer(
      //   child: MainDrawer(),
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Theme.of(context).hoverColor,
          currentIndex: _selectedPageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(FlutterIcons.restaurant_mdi),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(FlutterIcons.bookmark_mdi),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(FlutterIcons.user_faw5s),
                label: ''),
          ],
        ),
      ),
    );
  }
}
