import 'package:flutter/material.dart';
import 'package:tourist/widgets/trip_item.dart';
import '../models/trips.dart';

class FavorietsScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  FavorietsScreen(this.favoriteTrips);
  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
          child: Text(
        'ليس لديك أي رحلة في قائمة المفضلة',
        style: TextStyle(
          fontFamily: 'ElMessiri',
        ),
      ));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
