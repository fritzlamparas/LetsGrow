// ignore_for_file: camel_case_types, use_build_context_synchronously, unnecessary_null_comparison
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  int notificationid = 0;
  String humidity = '0';
  String light = '0';
  String soilm = '0';
  String temp = '0';
  String ph = '0';

  @override
  void initState() {
    super.initState();

    fetchReadings();
    const checkInterval = Duration(minutes: 5); // Adjust the interval as needed
    Timer.periodic(checkInterval, (timer) {
      checkSoilM();
      Future.delayed(const Duration(seconds: 2), () {
        checkLuminosity();
      });
      Future.delayed(const Duration(seconds: 3), () {
        checkTemperature();
      });
      Future.delayed(const Duration(seconds: 4), () {
        checkHumidity();
      });
      Future.delayed(const Duration(seconds: 5), () {
        checkpH();
      });
    });

    // Initialize the plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void checkHumidity() async {
    if (double.parse(humidity) >= 90.0) {
      showHumidityAlert('Humidity is above 90 percent.');
    } else if (double.parse(humidity) <= 50.0) {
      showHumidityAlert('Humidity is below 50 percent.');
    }
  }

  void checkLuminosity() async {
    if (double.parse(light) >= 6001) {
      showLuminosityAlert('Luminosity is above 6000 lux.');
    } else if (double.parse(light) <= 5000.0) {
      showLuminosityAlert('Luminosity is below 5000 lux.');
    }
  }

  void checkTemperature() async {
    if (double.parse(temp) >= 30.0) {
      showTemperatureAlert('Temperature is above 30 degrees.');
    } else if (double.parse(temp) <= 18.0) {
      showTemperatureAlert('Temperature is below 18 degrees.');
    }
  }

  void checkSoilM() async {
    if (double.parse(soilm) >= 85.0) {
      showSoilMoistureAlert('Soil Moisture is above 85 percent.');
    } else if (double.parse(soilm) <= 70.0) {
      showSoilMoistureAlert('Soil Moisture is below 70 percent.');
    }
  }

  void checkpH() async {
    if (double.parse(ph) >= 8.0) {
      showPhAlert('pH is above 8.');
    } else if (double.parse(ph) <= 6.5) {
      showPhAlert('pH is below 6.5.');
    }
  }

  void showTemperatureAlert(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'temperature_channel',
      'Temperature Alert',
      'Alerts when temperature is above 30 degrees or below 18 degrees',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    notificationid++;
    await flutterLocalNotificationsPlugin.show(
      notificationid,
      'Temperature Alert',
      message,
      platformChannelSpecifics,
    );
  }

  void showSoilMoistureAlert(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'soilm_channel',
      'Soil Moisture Alert',
      'Alerts when soil moisture is above 85% or below 70%',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    notificationid++;
    await flutterLocalNotificationsPlugin.show(
      notificationid,
      'Soil Moisture Alert',
      message,
      platformChannelSpecifics,
    );
  }

  void showPhAlert(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'ph_channel',
      'pH Alert',
      'Alerts when pH is above 8 or below 6.5',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    notificationid++;
    await flutterLocalNotificationsPlugin.show(
      notificationid,
      'pH Alert',
      message,
      platformChannelSpecifics,
    );
  }

  void showHumidityAlert(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'humidity_channel',
      'Humidity Alert',
      'Alerts when humidity is above 90 percent or below 50 percent',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    notificationid++;
    await flutterLocalNotificationsPlugin.show(
      notificationid,
      'Humidity Alert',
      message,
      platformChannelSpecifics,
    );
  }

  void showLuminosityAlert(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'luminosity_channel',
      'Luminosity Alert',
      'Alerts when luminosity is above 6000 lux or below 5000 lux',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    notificationid++;
    await flutterLocalNotificationsPlugin.show(
      notificationid,
      'Luminosity Alert',
      message,
      platformChannelSpecifics,
    );
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
          if (kDebugMode) {
            print('hum: ${double.parse(humidity)}');
          }
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
          if (kDebugMode) {
            print('L: ${double.parse(light)}');
          }
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
          if (kDebugMode) {
            print('sm: ${double.parse(soilm)}');
          }
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
          if (kDebugMode) {
            print('temp: ${double.parse(temp)}');
          }
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
          if (kDebugMode) {
            print('ph: ${double.parse(ph)}');
          }
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
            const SizedBox(height: 5),
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
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Temperature Progress Bar
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
                      const SizedBox(height: 10), // Adjust the height as needed
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
                      const SizedBox(height: 10), // Adjust the height as needed
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
              ],
            ),
            const SizedBox(
              height: 15,
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
                        percent: double.parse(ph) / 14,
                        center: const Text(
                          'pH Value',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: Colors.orange,
                      ),
                      const SizedBox(height: 10), // Adjust the height as needed
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
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 5,
                        percent: double.parse(soilm) / 100,
                        center: const Text(
                          'Soil Moisture',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: Colors.green,
                      ),
                      const SizedBox(height: 10), // Adjust the height as needed
                      Text(
                        '$soilm%',
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
              height: 15,
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
                    percent: double.parse(light) / 7000,
                    center: const Text(
                      'Luminosity',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    progressColor: Colors.yellow,
                  ),
                  const SizedBox(height: 10), // Adjust the height as needed
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
      ),
    );
  }
}
