import 'package:flutter/material.dart';
import 'genderSelection.dart'; // Updated import to reference the correct file
import 'package:animated_text_kit/animated_text_kit.dart'; // Import for animated text
import 'package:get/get.dart';
import '../mainScreens/home.dart'; // Import the HomeScreen

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Screen"),
        leading: IconButton(
          icon: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue, // Blue background
            child: Icon(Icons.arrow_back, color: Colors.white), // White arrow icon
          ),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen (HomeScreen)
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image with Overlay
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/background.jpg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.6), // Overlay to reduce brightness
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Coach Image in a Circle with Border
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.8),
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 65,
                      backgroundImage:
                      AssetImage('lib/assets/images/coach.png'), // Path to your image
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Animated Title Text
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Hello!',
                        textStyle: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                  const SizedBox(height: 20),

                  // Subtitle Text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      "I'm your personal coach.\nHere are some questions to tailor your personalized plan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        height: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black87,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Button with animation
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const GenderScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      elevation: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "I'm Ready",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
