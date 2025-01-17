import 'package:fitness_app_nodejs/screens/authentications/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/authentications/login_screen.dart'; // Adjust the path to your login screen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), // Loads the login screen as the first screen
    );
  }
}
