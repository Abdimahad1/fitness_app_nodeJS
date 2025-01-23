import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart'; // Import the UserController
import 'height.dart';
import 'startNow.dart'; // Import the StartNowScreen

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double selectedWeight = 60.0; // Default weight in kg
  double heightInCm = 165; // Default height in cm
  bool isKg = true; // Toggle between kg and lbs

  final UserController userController = Get.find<UserController>(); // Access UserController

  String getWeightCategory(double weight, double height) {
    double weightInKg = isKg ? weight : weight / 2.20462; // Convert to kg if in lbs
    double heightInMeters = height / 100; // Convert height to meters
    double bmi = weightInKg / (heightInMeters * heightInMeters);

    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.offAll(() => const HeightScreen()), // Changed to navigate back to HeightScreen
            ),
          ),
        ),
        title: const Text(
          "What's your current weight?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
                      isKg = true;
                      selectedWeight = (selectedWeight / 2.20462)
                          .clamp(40.0, 150.0); // Convert to kg if switching
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isKg ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Text(
                      "kg",
                      style: TextStyle(
                        color: isKg ? Colors.white : Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = false;
                      selectedWeight = (selectedWeight * 2.20462)
                          .clamp(88.0, 330.0); // Convert to lbs if switching
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isKg ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Text(
                      "lbs",
                      style: TextStyle(
                        color: !isKg ? Colors.white : Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Weight Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.blue,
                inactiveTrackColor: Colors.white70,
                thumbColor: Colors.blue,
                overlayColor: Colors.blue.withOpacity(0.2),
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
                value: selectedWeight,
                min: isKg ? 40 : 88, // Adjust min for lbs
                max: isKg ? 150 : 330, // Adjust max for lbs
                divisions: isKg ? 110 : 242, // Adjust divisions for lbs
                label: isKg
                    ? "${selectedWeight.toInt()} kg"
                    : "${selectedWeight.toInt()} lbs", // Label based on unit
                onChanged: (value) {
                  setState(() {
                    selectedWeight = value; // Update weight
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Display Selected Weight
            Text(
              isKg
                  ? "${selectedWeight.toInt()} kg"
                  : "${selectedWeight.toInt()} lbs",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Display Weight Category
            Text(
              getWeightCategory(selectedWeight, heightInCm),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 40),

            // Next Button
            ElevatedButton(
              onPressed: () {
                // Update weight in UserController
                final weightString = isKg
                    ? "${selectedWeight.toInt()} kg"
                    : "${selectedWeight.toInt()} lbs";
                userController.updateUser(weight: weightString);

                // Navigate to the StartNowScreen
                Get.offAll(() => const StartNowScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 20),
                elevation: 5,
              ),
              child: const Text(
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
