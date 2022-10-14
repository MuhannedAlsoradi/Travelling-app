// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tourist/widgets/categories_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map(
        (CategoryData) => CategoryItem(
          CategoryData.id,
          CategoryData.title,
          CategoryData.imageUrl,
        ),
      ).toList(),
    );
  }
}
