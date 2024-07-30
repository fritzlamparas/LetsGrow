import 'package:flutter/material.dart';
import 'package:letsgrow/nav_pages/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    name: 'LGStorage',
    options: const FirebaseOptions(
      appId: '1:1046165645440:android:4e4cf0943245e548435e65',
      apiKey: 'AIzaSyBslHa8b8MsX3qriroO73AmhfbTylv-PMQ',
      projectId: 'esp32-cam-firebase-ef165',
      messagingSenderId: '1046165645440',
      storageBucket: "esp32-cam-firebase-ef165.appspot.com",
    ),
  );
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: 'LetsGrow', home: mainPage());
  }
}
