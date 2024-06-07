import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const AviaApp());
}

class AviaApp extends StatelessWidget {
  const AviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen()
    );
  }
}
