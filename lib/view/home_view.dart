import 'package:deprem_app/view/earthquake_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, const Color.fromARGB(255, 161, 119, 229)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Son Depremler",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 39, 38, 38), shadows: [
                Shadow(
                  color: const Color.fromARGB(71, 0, 0, 0),
                  offset: Offset(0, 3),
                  blurRadius: 3,
                )
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image.asset("assets/picture.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EarthquakeView()));
                },
                child: Text("Başla"))
          ],
        ),
      ),
    );
  }
}
