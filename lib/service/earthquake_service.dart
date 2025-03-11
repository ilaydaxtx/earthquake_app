import 'dart:convert';

import 'package:deprem_app/main.dart';
import 'package:deprem_app/model/earthquake_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class EarthquakeService {
  static const String apiUrl = 'https://deprem.afad.gov.tr/apiv2/event/filter?start=2025-01-01 10:00:00&end=2025-02-20 10:00:00';

  Future<List<Earthquake>> fetchEarthquakes() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      print('API Response Status Code: ${response.statusCode}');
      print('API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => Earthquake.fromJson(e)).toList();
      } else {
        print('Hata: API başarısız cevap verdi. Kod: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }
}
