import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const VLiteApp());
}

class VLiteApp extends StatelessWidget {
  const VLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'V-LITE',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF161616),
      ),
      home: const LoginScreen(),
    );
  }
}