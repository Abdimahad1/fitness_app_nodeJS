import 'package:fitness_app_nodejs/screens/startUp/weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../mainScreens/home.dart'; // Import the HomeScreen

class StartNowScreen extends StatelessWidget {
  const StartNowScreen({super.key});

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
              onPressed: () => Get.offAll(() => const WeightScreen()), // Changed to navigate back to WeightScreen
            ),
          ),
        ),
        title: const Text(
          "Start Your Journey",
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Coach Image
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Image.asset(
                'lib/assets/images/coach.png', // Replace with the path to your coach image
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            // Heading Text
            const Text(
              "You're All Set!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Subheading Text
            const Text(
              "We've organized all your details and scheduled everything. Now, let's begin your fitness journey and achieve your goals!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Start Journey Button
            ElevatedButton(
              onPressed: () {
                // Navigate to HomeScreen after completing the start process
                Get.off(() => const HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 5,
              ),
              child: const Text(
                "Start Your Journey",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
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
