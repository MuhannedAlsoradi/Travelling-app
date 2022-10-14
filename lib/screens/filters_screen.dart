// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Families = false;
  @override
  void initState() {
    _Summer = widget.currentFilters['summer'] as bool;
    _Winter = widget.currentFilters['winter'] as bool;
    _Families = widget.currentFilters['family'] as bool;
    super.initState();
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subTitle,
    var currentValue,
    updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontFamily: 'ElMessiri', fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontFamily: 'ElMessiri'),
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الفلترة'),
        actions: [
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': _Summer,
                'winter': _Winter,
                'familiy': _Families,
              };
              widget.saveFilters();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 30),
          buildSwitchListTile(
            'الرحلات الصيفية فقط',
            'إظهار الرحلات التي في فصل الصيف فقط',
            _Summer,
            (newValue) {
              setState(() {
                _Summer = newValue;
              });
            },
          ),
          buildSwitchListTile(
            'الرحلات الشتوية فقط',
            'إظهار الرحلات التي في فصل الشتاء فقط',
            _Winter,
            (newValue) {
              setState(() {
                _Winter = newValue;
              });
            },
          ),
          buildSwitchListTile(
            'الرحلات العائلية فقط',
            'إظهار الرحلات التي تخص العائلات فقط',
            _Families,
            (newValue) {
              setState(() {
                _Families = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
