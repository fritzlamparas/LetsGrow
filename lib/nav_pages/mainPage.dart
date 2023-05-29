import 'package:flutter/material.dart';
import 'package:letsgrow/nav_pages/aboutUs.dart';
import 'package:letsgrow/nav_pages/camera.dart';
import 'package:letsgrow/nav_pages/feedBack.dart';
import 'package:letsgrow/nav_pages/home.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List pages = [
    const homePage(),
    const cameraPage(),
    const AboutUsPage(),
    const FeedbackPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromRGBO(12, 192, 223, 1.0),
        unselectedItemColor: const Color.fromRGBO(102, 124, 138, 1.0),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sensors,
            ),
            label: 'Sensors',
          ), //Home
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            label: 'Growth Rate',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback,
            ),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}
