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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 71, 69, 69), shadows: [
                Shadow(
                  color: const Color.fromARGB(70, 15, 15, 15),
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
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "Depremler, yer kabuğunun altındaki tektonik plakaların hareketi sonucu meydana gelen ani ve şiddetli yer sarsıntılarıdır. Bunlar, en güçlü ve yıkıcı doğal olaylardan biri olup, binalara, altyapılara ciddi zararlar verebilir ve can kaybına yol açabilir.",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 71, 69, 69), shadows: [
                  Shadow(
                    color: const Color.fromARGB(70, 15, 15, 15),
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  )
                ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EarthquakeView()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(102, 173, 108, 219),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(53, 0, 0, 0),
                        offset: Offset(-1, 5),
                        blurRadius: 3,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Text(
                    "Başla",
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
