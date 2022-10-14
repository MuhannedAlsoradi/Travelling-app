// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';
  final Function manageFavorite;
  final Function isFavorite;
  TripDetailScreen(this.manageFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String sectionTitle) {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Text(
        '$sectionTitle',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListVeiwContainer(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere(
      (trip) => trip.id == tripId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedTrip.title}',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'الأنشطة'),
            buildListVeiwContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedTrip.activities[index],
                      style: TextStyle(fontFamily: 'ElMessiri'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'البرنامج اليومي'),
            SizedBox(
              width: 20,
            ),
            buildListVeiwContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          'يوم ${index + 1}',
                        ),
                      ),
                      title: Text(
                        selectedTrip.program[index],
                        style: TextStyle(fontFamily: 'ElMessiri'),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => manageFavorite(tripId),
      ),
    );
  }
}
