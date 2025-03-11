import 'package:deprem_app/main.dart';
import 'package:deprem_app/model/earthquake_model.dart';
import 'package:deprem_app/service/earthquake_service.dart';
import 'package:flutter/material.dart';

class EarthquakeViewModel extends ChangeNotifier {
  final EarthquakeService _service = EarthquakeService();
  List<Earthquake> earthquakes = [];
  bool isLoading = false;

  Future<void> getEarthquakes() async {
    isLoading = true;
    notifyListeners();
    try {
      earthquakes = await _service.fetchEarthquakes();
    } catch (e) {
      print('Hata: $e');
    }
    isLoading = false;
    notifyListeners();
  }
}
