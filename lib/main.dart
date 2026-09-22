import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SuccessTestApp());
}

class SuccessTestApp extends StatelessWidget {
  const SuccessTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuccessTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
