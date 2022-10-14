// ignore_for_file: camel_case_types, constant_identifier_names

enum Season {
  Winter,
  Summer,
  Spring,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final int duration;
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;
  final List<String> program;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.activities,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
    required this.duration,
    required this.program,
  });
}
