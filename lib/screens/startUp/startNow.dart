import 'package:flutter/material.dart';

class StartNowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Plan is Ready!",
          style: TextStyle(color: Colors.black), // Black text for the title
        ),
        backgroundColor: Colors.white, // White background for the AppBar
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // Black color for icons
      ),
      body: Container(
        color: Colors.white, // White background for the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/assets/images/coach.png'), // Replace with your user image path
            ),
            SizedBox(height: 20),
            // Main Title
            Text(
              "Your plan is ready!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text
              ),
            ),
            SizedBox(height: 10),
            // Subtitle
            Text(
              "We have selected this plan that suits you best",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30),
            // Challenge Rectangle
            Stack(
              clipBehavior: Clip.none, // Allows the image to overflow outside the rectangle
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF007BFF), // Blue rectangle
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FULL BODY 7X4 CHALLENGE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text for title
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Start your body-toning journey to target all muscle groups and build your dream body in 4 weeks!",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70, // Slightly dimmed white text
                        ),
                      ),
                    ],
                  ),
                ),
                // Image positioned partially outside the rectangle
                Positioned(
                  top: -15, // Adjusted closer to the rectangle
                  right: 15, // Moved slightly inward to prevent touching the screen edge
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/coach.png'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle, // Circle shape for the image
                      border: Border.all(color: Colors.blue, width: 4), // Border to blend with the rectangle
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Start Now Button
            ElevatedButton(
              onPressed: () {
                // Handle start action
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
                "START NOW",
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
