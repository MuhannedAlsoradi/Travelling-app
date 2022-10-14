// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, dead_code, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tourist/models/trips.dart';
import '../screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  //final Function removeItem;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
    // required this.removeItem,
  });

  String get SeasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get TripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Activities:
        return 'نشاطات';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        TripDetailScreen.screenRoute,
        arguments: id,
      ).then((result) {
        print(result);
        // removeItem(result);
      }),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 7,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              Container(
                height: 250,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: [0.6, 1],
                  ),
                ),
                child: Text(title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$duration يوم',
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      SeasonText,
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.family_restroom,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      TripTypeText,
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
