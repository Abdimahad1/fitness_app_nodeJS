import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  double selectedHeight = 165; // Default height in cm
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
                      // Convert height to cm if switching from ft
                      selectedHeight = (selectedHeight * 30.48).clamp(150, 200);
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
                      // Convert height to ft if switching from cm
                      selectedHeight = (selectedHeight / 30.48).clamp(4.0, 7.0);
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
              min: isCm ? 150 : 4.0, // Adjust min for ft
              max: isCm ? 200 : 7.0, // Adjust max for ft
              divisions: isCm ? 50 : 30, // Adjust divisions for ft
              label: isCm
                  ? "${selectedHeight.toInt()} cm"
                  : "${selectedHeight.toStringAsFixed(2)} ft", // Label based on unit
              onChanged: (value) {
                setState(() {
                  selectedHeight = value; // Update height
                });
              },
            ),
            SizedBox(height: 20),
            // Display Selected Height
            Text(
              isCm
                  ? "${selectedHeight.toInt()} cm"
                  : "${selectedHeight.toStringAsFixed(2)} ft",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Next Button
            ElevatedButton(
              onPressed: () {
                // Handle next action
                print("Selected Height: ${isCm ? '${selectedHeight.toInt()} cm' : '${selectedHeight.toStringAsFixed(2)} ft'}");
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
