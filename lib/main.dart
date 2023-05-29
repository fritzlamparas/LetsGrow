import 'package:flutter/material.dart';
import 'package:letsgrow/nav_pages/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  // Initialize the second Firebase project
  await Firebase.initializeApp(
      name: 'FirestoreFeedback',
      options: const FirebaseOptions(
        appId: '1:1065360798865:android:e184df33eda6ada7bdfb30',
        apiKey: 'AIzaSyBxz3fI5M6-SdDxTW5aEk0yn4MdqV6kBIg',
        projectId: 'letsgrowdp2-36165', messagingSenderId: '1065360798865',
        // Add other configuration options specific to the second project
      ));
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
