// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                'دليلك السياحي',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () =>
                Navigator.pushReplacementNamed(context, TabsScreen.screenRoute),
            leading: Icon(
              Icons.hail,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
            title: Text(
              'الرحلات',
              style: TextStyle(
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(
                context, FiltersScreen.screenRoute),
            leading: Icon(
              Icons.bar_chart,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
            title: Text(
              'الفلترة',
              style: TextStyle(
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    Function onTapFunction,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
