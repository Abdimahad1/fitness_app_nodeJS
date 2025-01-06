import 'package:flutter/material.dart';
import 'genderSelection.dart'; // Updated import to reference the correct file

class HelloScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('lib/assets/images/coach.png'), // Path to your image
            ),
            SizedBox(height: 30),

            // Title Text
            Text(
              'Hello!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Subtitle Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "I'm your personal coach.\nHere are some questions to tailor your personalized plan.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 50),

            // Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the GenderScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenderScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                "I'm Ready",
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
