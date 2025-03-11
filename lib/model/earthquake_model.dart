class Earthquake {
  final String title;
  final DateTime date;
  final double magnitude;
  final double depth;
  final String city;
  final String region;
  final String coordinates;

  Earthquake({
    required this.title,
    required this.date,
    required this.magnitude,
    required this.depth,
    required this.city,
    required this.region,
    required this.coordinates,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      title: json['location'] ?? 'Bilinmiyor',
      date: DateTime.tryParse(json['date']) ?? DateTime.now(),
      magnitude: double.tryParse(json['magnitude'].toString()) ?? 0.0,
      depth: double.tryParse(json['depth'].toString()) ?? 0.0,
      city: json['location_properties']?['epiCenter']?['name'] ?? 'Aktif Değil',
      region: json['location_properties']?['epiCenter']?['name'] ?? 'Bilinmiyor',
      coordinates: json['geojson']?['coordinates'] != null ? '${json['geojson']['coordinates'][0]}, ${json['geojson']['coordinates'][1]}' : 'Bilinmiyor',
    );
  }
}
