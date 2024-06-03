import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/location_access_screen.dart';
import 'package:foodpanda_ui_clone/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Food Panda UI Clone',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
