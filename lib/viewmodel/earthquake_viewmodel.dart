import 'package:deprem_app/model/earthquake_model.dart';
import 'package:deprem_app/service/earthquake_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EarthquakeViewModel extends ChangeNotifier {
  final EarthquakeService _service = EarthquakeService();
  List<Earthquake> earthquakes = [];
  bool isLoading = false;
  DateTime? startDate;
  DateTime? endDate;

  Future<void> getEarthquakes({String? start, String? end}) async {
    isLoading = true;
    notifyListeners();
    try {
      earthquakes = await _service.fetchEarthquakes(startDate: start, endDate: end);
    } catch (e) {
      print('Hata: $e');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<DateTime?> selectDateFunction(BuildContext context, DateTime? initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000), // Eski depremleri de seçebilmek için
      lastDate: DateTime.now(),
    );
  }

  void setDate(DateTime date, bool isStartDate) {
    if (isStartDate) {
      startDate = date;
    } else {
      endDate = date;
    }
    notifyListeners();

    if (startDate != null && endDate != null) {
      getEarthquakesByDateRange();
    }
  }

  Future<void> getEarthquakesByDateRange() async {
    if (startDate == null || endDate == null) return;

    String formattedStart = DateFormat('yyyy-MM-dd').format(startDate!);
    String formattedEnd = DateFormat('yyyy-MM-dd').format(endDate!);

    getEarthquakes(start: formattedStart, end: formattedEnd);
  }
}
