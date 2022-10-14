// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tourist/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        CategoryTripsScreen.screenRoute,
        arguments: {
          'id': id,
          'title': title,
        },
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
