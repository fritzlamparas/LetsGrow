// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PhotoDisplayPage extends StatefulWidget {
  const PhotoDisplayPage({Key? key}) : super(key: key);

  @override
  _PhotoDisplayPageState createState() => _PhotoDisplayPageState();
}

class _PhotoDisplayPageState extends State<PhotoDisplayPage> {
  final FirebaseStorage storage =
      FirebaseStorage.instanceFor(app: Firebase.app('LGStorage'));
  late String imageUrl = '';
  late String fileName = 'photo_0706_0600.jpg';
  late String imageUrl2 = '';
  late String fileName2 = '';
  bool showBody = false;

  @override
  void initState() {
    super.initState();
    // Delay the showing of the body by 2 seconds
    getMostRecentImage();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        showBody = true;
      });
    });
  }

  void getMostRecentImage() async {
    Reference imagesRef = storage.ref().child('data');
    Reference imagesRef2 = storage.ref().child('processed');

    // List all items (images) in the folder
    ListResult listResult = await imagesRef.listAll();
    ListResult listResult2 = await imagesRef2.listAll();

    // Sort the items by their file names in descending order
    listResult.items.sort((a, b) {
      String fileNameA = a.name;
      String fileNameB = b.name;
      // Extract the date and time components from the file names
      String dateTimeA = fileNameA.substring(7, 15);
      String dateTimeB = fileNameB.substring(7, 15);
      // Compare the date and time components in reverse order
      return dateTimeB.compareTo(dateTimeA);
    });
    listResult2.items.sort((a, b) {
      String fileNameAA = a.name;
      String fileNameBB = b.name;
      // Extract the date and time components from the file names
      String dateTimeAA = fileNameAA.substring(7, 15);
      String dateTimeBB = fileNameBB.substring(7, 15);
      // Compare the date and time components in reverse order
      return dateTimeBB.compareTo(dateTimeAA);
    });
    // Get the most recent image
    if (listResult.items.isNotEmpty) {
      Reference mostRecentImage = listResult.items.last;
      String newImageUrl = await mostRecentImage.getDownloadURL();
      String aqfileName = mostRecentImage.name;

      setState(() {
        imageUrl = newImageUrl;
        fileName = aqfileName;
        // You can use the `fileName` variable as needed
      });
    }
    if (listResult2.items.isNotEmpty) {
      Reference mostRecentImage2 = listResult2.items.last;
      String newImageUrl2 = await mostRecentImage2.getDownloadURL();
      String aqfileName2 = mostRecentImage2.name;

      setState(() {
        imageUrl2 = newImageUrl2;
        fileName2 = aqfileName2;
        // You can use the `fileName` variable as needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract month, day, hour, and minute from the fileName
    String month = fileName.substring(6, 8);
    String day = fileName.substring(8, 10);
    String hour = fileName.substring(11, 13);
    String minute = fileName.substring(13, 15);

    // Map the month number to the corresponding month name
    Map<String, String> monthNames = {
      '01': 'January',
      '02': 'February',
      '03': 'March',
      '04': 'April',
      '05': 'May',
      '06': 'June',
      '07': 'July',
      '08': 'August',
      '09': 'September',
      '10': 'October',
      '11': 'November',
      '12': 'December',
    };

    // Get the month name from the map
    String monthName = monthNames[month] ?? '';

    // Convert hour to 12-hour format
    int hourInt = int.tryParse(hour) ?? 0;
    String formattedHour = (hourInt % 12).toString().padLeft(2, '0');

    // Determine if it's AM or PM
    String period = hourInt < 12 ? 'AM' : 'PM';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Surface Area Estimations",
          style: TextStyle(
            color: Color.fromRGBO(12, 192, 223, 1.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 95, 94, 94),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: showBody,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Date: $monthName $day',
                      style: const TextStyle(
                        fontFamily: 'RobotoMedium',
                        fontSize: 18,
                        color: Color.fromRGBO(12, 192, 223, 1.0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Time: $formattedHour:$minute $period',
                      style: const TextStyle(
                        fontFamily: 'RobotoMedium',
                        fontSize: 18,
                        color: Color.fromRGBO(12, 192, 223, 1.0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.network(imageUrl),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.network(imageUrl2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Display circular progress indicator while body is not visible
          if (!showBody)
            const Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  color: Color.fromRGBO(12, 192, 223, 1.0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
