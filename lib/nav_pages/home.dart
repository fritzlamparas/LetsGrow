// ignore_for_file: camel_case_types, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  List<double> humidityReadings = [];
  String humidity = '68';

  @override
  void initState() {
    super.initState();
    fetchHumidityReadings();
    if (kDebugMode) {
      print('fetchHumidityReadings() executed');
    }
  }

  void fetchHumidityReadings() {
    if (kDebugMode) {
      print('Inside fetchHumidityReadings()');
    }
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('Sensor').child('Humidity');
    databaseReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        // `data` has fetched a value
        // You can use `data` here
        if (kDebugMode) {
          print('Fetched data: $data');
        }
        setState(() {
          humidity = data.toString();
        });
      } else {
        // `data` is null, indicating that it did not fetch a value
        if (kDebugMode) {
          print('No data fetched');
        }
        setState(() {
          humidity = '69'; // Set humidity to an appropriate default value
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "LetsGrow",
          style: TextStyle(
              color: Color.fromRGBO(12, 192, 223, 1.0),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 95, 94, 94),
      ),
      backgroundColor: const Color(0xffeeeeee),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              alignment: Alignment.center,
              child: const Text(
                'Sensor Readings',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'RobotoBold',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              alignment: Alignment.center,
              child: Text(
                'Humidity: $humidity',
                style: const TextStyle(
                  fontSize: 35,
                  fontFamily: 'RobotoBold',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
