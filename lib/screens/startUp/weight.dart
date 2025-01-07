import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double selectedWeight = 74.8; // Default weight in kg
  bool isKg = true; // Toggle between kg and lbs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What's your current weight?"),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weight Unit Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = true; // Set to kg
                      // Convert weight to kg if switching from lbs
                      selectedWeight = (selectedWeight / 2.20462).clamp(40.0, 150.0);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isKg ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "kg",
                      style: TextStyle(color: isKg ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = false; // Set to lbs
                      // Convert weight to lbs if switching from kg
                      selectedWeight = (selectedWeight * 2.20462).clamp(88.0, 330.0);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isKg ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "lbs",
                      style: TextStyle(color: !isKg ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Weight Slider
            Slider(
              value: selectedWeight,
              min: isKg ? 40 : 88, // Adjust min for lbs
              max: isKg ? 150 : 330, // Adjust max for lbs
              divisions: isKg ? 110 : 30, // Adjust divisions for lbs
              label: isKg
                  ? "${selectedWeight.toStringAsFixed(1)} kg"
                  : "${selectedWeight.toStringAsFixed(1)} lbs", // Label based on unit
              onChanged: (value) {
                setState(() {
                  selectedWeight = value; // Update weight
                });
              },
            ),
            SizedBox(height: 20),
            // Display Selected Weight
            Text(
              isKg
                  ? "${selectedWeight.toStringAsFixed(1)} kg"
                  : "${selectedWeight.toStringAsFixed(1)} lbs",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Next Button
            ElevatedButton(
              onPressed: () {
                // Handle next action
                print(
                    "Selected Weight: ${isKg ? '${selectedWeight.toStringAsFixed(1)} kg' : '${selectedWeight.toStringAsFixed(1)} lbs'}");
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
