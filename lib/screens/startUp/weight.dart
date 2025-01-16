import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'startNow.dart'; // Import the StartNowScreen

class WeightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What's your current weight?"),
      ),
      body: SingleChildScrollView( // Wrap the body with SingleChildScrollView
        child: Container(
          color: Colors.white, // Background color
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16), // Add padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Weight Unit Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Set to kg
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: true ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "kg",
                        style: TextStyle(color: true ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Set to lbs
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: !true ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "lbs",
                        style: TextStyle(color: !true ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Weight Slider
              Slider(
                value: 60.0, // Default value for demonstration
                min: 40, // Minimum weight in kg
                max: 150, // Maximum weight in kg
                divisions: 110, // Number of steps
                label: "${60.0.toStringAsFixed(1)} kg", // Label based on unit
                onChanged: (value) {
                  // Update weight logic
                },
              ),
              SizedBox(height: 20),
              // Display Selected Weight
              Text(
                "${60.0.toStringAsFixed(1)} kg",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              // Next Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the StartNowScreen using GetX
                  Get.to(() => StartNowScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  elevation: 5,
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
      ),
    );
  }
}
