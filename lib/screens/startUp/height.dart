import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  double selectedHeight = 165; // Default height
  bool isCm = true; // Toggle between cm and ft

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What's your height?"),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Height Unit Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCm = true; // Set to cm
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isCm ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "cm",
                      style: TextStyle(color: isCm ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCm = false; // Set to ft
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isCm ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "ft",
                      style: TextStyle(color: !isCm ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Height Slider
            Slider(
              value: selectedHeight,
              min: isCm ? 150 : 4.9, // Adjust min for ft
              max: isCm ? 200 : 6.5, // Adjust max for ft
              divisions: isCm ? 50 : 20, // Adjust divisions for ft
              label: isCm ? "${selectedHeight.toInt()} cm" : "${(selectedHeight * 12).toInt()} ft", // Label based on unit
              onChanged: (value) {
                setState(() {
                  selectedHeight = value; // Update height
                });
              },
            ),
            SizedBox(height: 20),
            // Display Selected Height
            Text(
              "${selectedHeight.toInt()} ${isCm ? 'cm' : 'ft'}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Next Button
            ElevatedButton(
              onPressed: () {
                // Handle next action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20), // Increased padding for larger button
                elevation: 5, // Add shadow for depth
              ),
              child: Text(
                "NEXT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
