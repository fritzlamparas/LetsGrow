import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: const Text(
                'About LetsGrow',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'RobotoBold',
                    color: Color.fromRGBO(12, 192, 223, 1.0)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: const Text(
                'LetsGrow is a growth monitoring software that uses image processing to detect the growth rate of lettuces grown in an aquaponic system according to the pictures gathered while it is being monitored. This app can also access the parameters gathered using the placed sensors in the system.',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMedium',
                    color: Colors.black,
                    height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: const Text('App Creators',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoBold',
                      color: Color.fromRGBO(12, 192, 223, 1.0)),
                  textAlign: TextAlign.center),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(12, 192, 223, 1.0),
                        radius: 60,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/Ryan_pic.jpg'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: const Text(
                          'Ryan U. Avena',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'RobotoMedium',
                              color: Colors.black),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(12, 192, 223, 1.0),
                        radius: 60,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/Russel_pic.jpg'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: const Text(
                          'Russel Ivan B. Bataller',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'RobotoMedium',
                              color: Colors.black),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(12, 192, 223, 1.0),
                        radius: 60,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/JC_pic.jpg'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: const Text(
                          'John Carlo P. Hermosa',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'RobotoMedium',
                              color: Colors.black),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(12, 192, 223, 1.0),
                        radius: 60,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/Fritz_pic.jpg'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: const Text(
                          'Fritz D. Lamparas',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'RobotoMedium',
                              color: Colors.black),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
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
