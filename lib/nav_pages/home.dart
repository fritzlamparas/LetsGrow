// ignore_for_file: camel_case_types, use_build_context_synchronously, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  String humidity = '0';
  String light = '0';
  String soilm = '0';
  String temp = '0';
  String ph = '0';

  @override
  void initState() {
    super.initState();
    fetchReadings();
  }

  void fetchReadings() {
    DatabaseReference databaseReferenceh =
        FirebaseDatabase.instance.ref().child('Sensor').child('Humidity');
    databaseReferenceh.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        // `data` has fetched a value
        // You can use `data` here
        setState(() {
          humidity = data.toString();
        });
      } else {
        // `data` is null, indicating that it did not fetch a value
        setState(() {
          humidity = '0'; // Set humidity to an appropriate default value
        });
      }
    });
    DatabaseReference databaseReferencel =
        FirebaseDatabase.instance.ref().child('Sensor').child('LightSensor');
    databaseReferencel.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        // `data` has fetched a value
        // You can use `data` here
        setState(() {
          light = data.toString();
        });
      } else {
        // `data` is null, indicating that it did not fetch a value
        setState(() {
          light = '0'; // Set humidity to an appropriate default value
        });
      }
    });
    DatabaseReference databaseReferences =
        FirebaseDatabase.instance.ref().child('Sensor').child('SoilMoisture');
    databaseReferences.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        // `data` has fetched a value
        // You can use `data` here
        setState(() {
          soilm = data.toString();
        });
      } else {
        // `data` is null, indicating that it did not fetch a value
        setState(() {
          soilm = '0'; // Set humidity to an appropriate default value
        });
      }
    });
    DatabaseReference databaseReferencet =
        FirebaseDatabase.instance.ref().child('Sensor').child('Temperature');
    databaseReferencet.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        // `data` has fetched a value
        // You can use `data` here
        setState(() {
          temp = data.toString();
        });
      } else {
        // `data` is null, indicating that it did not fetch a value
        setState(() {
          temp = '0'; // Set humidity to an appropriate default value
        });
      }
    });
    DatabaseReference databaseReferencep =
        FirebaseDatabase.instance.ref().child('Sensor').child('pHValue');
    databaseReferencep.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        // `data` has fetched a value
        // You can use `data` here
        setState(() {
          ph = data.toString();
        });
      } else {
        // `data` is null, indicating that it did not fetch a value
        setState(() {
          ph = '0'; // Set humidity to an appropriate default value
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 5,
                        percent: double.parse(humidity) / 100,
                        center: const Text(
                          'Humidity',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: Colors.blue,
                      ),
                      const SizedBox(height: 20), // Adjust the height as needed
                      Text(
                        '$humidity%',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Light Progress Bar
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 5,
                        percent: double.parse(light) / 100,
                        center: const Text(
                          'Luminosity',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: Colors.yellow,
                      ),
                      const SizedBox(height: 20), // Adjust the height as needed
                      Text(
                        light,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 5,
                        percent: double.parse(soilm) / 300,
                        center: const Text(
                          'Soil Moisture',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: Colors.green,
                      ),
                      const SizedBox(height: 20), // Adjust the height as needed
                      Text(
                        '$soilm%',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ), // Temperature Progress Bar
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 5,
                        percent: double.parse(temp) / 80,
                        center: const Text(
                          'Temperature',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: Colors.red,
                      ),
                      const SizedBox(height: 20), // Adjust the height as needed
                      Text(
                        '$temp °C',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 60,
                    lineWidth: 5,
                    percent: double.parse(temp) / 100,
                    center: const Text(
                      'pH Value',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    progressColor: Colors.orange,
                  ),
                  const SizedBox(height: 20), // Adjust the height as needed
                  Text(
                    ph,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
