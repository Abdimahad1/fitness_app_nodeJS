import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/startUp/hello.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloScreen(), // Loads the Hello screen as the first screen
    );
  }
}
