import 'package:deprem_app/main.dart';
import 'package:deprem_app/model/earthquake_model.dart';
import 'package:deprem_app/viewmodel/earthquake_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EarthquakeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EarthquakeViewModel()..getEarthquakes(),
      child: Scaffold(
        appBar: AppBar(title: Text('Son Depremler')),
        body: Consumer<EarthquakeViewModel>(
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
                    title: Text('${eq.title}'),
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
    );
  }
}
