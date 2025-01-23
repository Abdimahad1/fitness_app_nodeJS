import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart'; // Import UserController
import 'birth.dart';
import 'weight.dart'; // Import the WeightScreen

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  double selectedHeight = 165; // Default height in cm
  bool isCm = true; // Toggle between cm and ft
  final UserController userController = Get.find<UserController>(); // Access UserController

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
              onPressed: () => Get.offAll(() => const BirthScreen()), // Changed to navigate back to BirthScreen
            ),
          ),
        ),
        title: const Text(
          "What's your height?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isCm ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      "cm",
                      style: TextStyle(
                        color: isCm ? Colors.white : Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCm = false; // Set to ft
                      // Convert height to ft if switching from cm
                      selectedHeight = (selectedHeight / 30.48).clamp(4.0, 7.0);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isCm ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      "ft",
                      style: TextStyle(
                        color: !isCm ? Colors.white : Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Height Slider
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
            ),
            const SizedBox(height: 20),

            // Display Selected Height
            Text(
              isCm
                  ? "${selectedHeight.toInt()} cm"
                  : "${selectedHeight.toStringAsFixed(2)} ft",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // Next Button
            ElevatedButton(
              onPressed: () {
                // Update height in UserController
                final heightString = isCm
                    ? "${selectedHeight.toInt()} cm"
                    : "${selectedHeight.toStringAsFixed(2)} ft";
                userController.updateUser(height: heightString);

                // Navigate to the WeightScreen
                Get.offAll(() => const WeightScreen());
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
