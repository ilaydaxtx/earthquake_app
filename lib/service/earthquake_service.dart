import 'dart:convert';

import 'package:deprem_app/main.dart';
import 'package:deprem_app/model/earthquake_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class EarthquakeService {
  static const String baseUrl = 'https://deprem.afad.gov.tr/apiv2/event/filter';

  Future<List<Earthquake>> fetchEarthquakes({String? startDate, String? endDate}) async {
    try {
      final defaultStart = '2025-01-01 10:00:00';
      final defaultEnd = '2025-03-11';
      final Uri uri = Uri.parse(baseUrl).replace(queryParameters: {
        'start': startDate ?? defaultStart,
        'end': endDate ?? defaultEnd,
      });
      final response = await http.get(Uri.parse(uri.toString()));

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
