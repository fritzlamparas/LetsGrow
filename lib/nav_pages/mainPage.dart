import 'package:flutter/material.dart';
import 'package:letsgrow/nav_pages/aboutUs.dart';
import 'package:letsgrow/nav_pages/feedBack.dart';
import 'package:letsgrow/nav_pages/home.dart';
import 'package:letsgrow/nav_pages/photodisplaypage.dart';
import 'package:letsgrow/nav_pages/webview_page.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final List<Widget> pages = [
    const homePage(),
    const WebviewPage(),
    const PhotoDisplayPage(),
    const AboutUsPage(),
    const FeedbackPage()
  ];
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'LetsGrow requires an internet connection to get the latest updates.',
              style: TextStyle(
                  color: Color(0xffeeeeee),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'RobotoMedium')),
          backgroundColor: Color.fromRGBO(12, 192, 223, 1.0),
          duration: Duration(seconds: 5),
        ),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      currentIndex = index;
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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
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
              Icons.area_chart,
            ),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
            ),
            label: 'Growth',
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
