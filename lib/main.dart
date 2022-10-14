// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tourist/app_data.dart';
import './models/trips.dart';
import './screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/category_trips_screen.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/trip_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'familiy': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['familiy'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                color: Colors.indigo,
                fontSize: 24,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesScreen(),
      initialRoute: '/starting-screen',
      routes: {
        '/starting-screen': (context) => TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (context) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (context) =>
            TripDetailScreen(_manageFavorite, _isFavorite),
        FiltersScreen.screenRoute: (context) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
