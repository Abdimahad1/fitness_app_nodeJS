import 'package:fitness_app_nodejs/controllers/user_controller.dart'; // Import UserController
import 'package:fitness_app_nodejs/screens/authentications/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Initialize the UserController
  Get.put(UserController()); // Ensures the UserController is available throughout the app

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), // Loads the login screen as the first screen
    );
  }
}
