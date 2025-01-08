import 'package:flutter/material.dart';

class WorkoutsScreen extends StatelessWidget {
  final String title;
  final String duration;
  final String level;

  WorkoutsScreen({required this.title, required this.duration, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Duration: $duration", style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text("Level: $level", style: TextStyle(fontSize: 18)),
            // Add more details about the workout here
          ],
        ),
      ),
    );
  }
}
