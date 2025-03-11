import 'package:deprem_app/model/earthquake_model.dart';
import 'package:deprem_app/viewmodel/earthquake_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EarthquakeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EarthquakeViewModel()..getEarthquakes(),
      child: Scaffold(
        appBar: AppBar(title: Text('Son Depremler')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDateButton(context, isStartDate: true),
                  _buildDateButton(context, isStartDate: false),
                ],
              ),
            ),
            Expanded(
              child: Consumer<EarthquakeViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (viewModel.earthquakes.isEmpty) {
                    return Center(child: Text('Deprem verisi bulunamadı.'));
                  }
                  return ListView.builder(
                    itemCount: viewModel.earthquakes.length,
                    itemBuilder: (context, index) {
                      Earthquake eq = viewModel.earthquakes[index];
                      return Card(
                        child: ListTile(
                          title: Text(eq.title),
                          subtitle: Text('Büyüklük: ${eq.magnitude} - Derinlik: ${eq.depth} km'),
                          trailing: Text(eq.city),
                          onTap: () {},
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context, {required bool isStartDate}) {
    return Consumer<EarthquakeViewModel>(
      builder: (context, viewModel, child) {
        DateTime? selectedDate = isStartDate ? viewModel.startDate : viewModel.endDate;
        return ElevatedButton(
          onPressed: () async {
            DateTime? pickedDate = await viewModel.selectDateFunction(context, selectedDate);
            if (pickedDate != null) {
              viewModel.setDate(pickedDate, isStartDate);
            }
          },
          child: Text(selectedDate == null ? (isStartDate ? "Başlangıç Tarihi Seç" : "Bitiş Tarihi Seç") : DateFormat('yyyy-MM-dd').format(selectedDate)),
        );
      },
    );
  }
}
