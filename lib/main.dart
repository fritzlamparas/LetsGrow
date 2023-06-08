import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:letsgrow/nav_pages/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initializeFirebase();
  await Firebase.initializeApp();
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

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp();
    if (kDebugMode) {
      print('Firebase initialization successful');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Firebase initialization failed: $e');
    }
  }
}
