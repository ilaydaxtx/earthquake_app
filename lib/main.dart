// main.dart
import 'package:deprem_app/view/earthquake_view.dart';
import 'package:deprem_app/view/home_view.dart';
import 'package:deprem_app/viewmodel/earthquake_viewmodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deprem Bilgi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
