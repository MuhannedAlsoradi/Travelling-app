// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import './categories_screen.dart';
import './favoriets_screen.dart';
import '../models/trips.dart';

class TabsScreen extends StatefulWidget {
  static const screenRoute = '/starting-screen';
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'screen': CategoriesScreen(),
        'title': 'تصنيفات الرحلات',
      },
      {
        'screen': FavorietsScreen(widget.favoriteTrips),
        'title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: 'ElMessiri'),
        unselectedLabelStyle: TextStyle(fontFamily: 'ElMessiri'),
        onTap: _selectScreen,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.indigo,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
