import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

