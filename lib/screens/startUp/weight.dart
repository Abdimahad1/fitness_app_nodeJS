import 'package:flutter/material.dart';
import 'startNow.dart'; // Import the StartNowScreen

class WeightScreen extends StatefulWidget {
  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double selectedWeight = 74.8; // Default weight in kg
  bool isKg = true; // Toggle between kg and lbs
  double height = 1.75; // User's height in meters (example default)

  // Method to calculate BMI
  double calculateBMI() {
    double weightInKg = isKg ? selectedWeight : selectedWeight / 2.20462;
    return weightInKg / (height * height);
  }

  // Method to determine BMI category
  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal";
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String category = getBMICategory(bmi);

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
            // BMI Display
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your BMI (${category})",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.black54,
                  ),
                  Spacer(),
                  Text(
                    "${bmi.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              category == "Normal"
                  ? "You're in great shape! Keep it up!"
                  : category == "Overweight"
                      ? "You only need a bit more sweat exercises to see a fitter you!"
                      : category == "Underweight"
                          ? "Consider adding more nutritious food to your diet."
                          : "Focus on a balanced diet and consistent exercise!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 40),
            // Next Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the StartNowScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartNowScreen()),
                );
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
