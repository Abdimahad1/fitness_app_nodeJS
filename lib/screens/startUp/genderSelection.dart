import 'package:flutter/material.dart';
import 'bodyType.dart'; // Import the BodyTypeScreen

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender; // Variable to hold the selected gender

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender; // Update the selected gender
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Gender'),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
          children: [
            // Gender Selection Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What's your gender?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Let us know you better",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 40),

                // Gender Selection Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Male Button
                    GestureDetector(
                      onTap: () => selectGender('Male'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedGender == 'Male' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedGender == 'Male' ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Image.asset('lib/assets/images/coach.png', width: 120), // Increased size
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Male',
                                  style: TextStyle(fontSize: 18),
                                ),
                                if (selectedGender == 'Male')
                                  Icon(Icons.check, color: Colors.blue), // Checkmark for selected
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Female Button
                    GestureDetector(
                      onTap: () => selectGender('Female'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedGender == 'Female' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedGender == 'Female' ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Image.asset('lib/assets/images/coach.png', width: 120), // Increased size
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Female',
                                  style: TextStyle(fontSize: 18),
                                ),
                                if (selectedGender == 'Female')
                                  Icon(Icons.check, color: Colors.blue), // Checkmark for selected
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Spacer(), // Adds dynamic space between Gender Selection and the button

            // Next Button Section
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Add space from the bottom
              child: ElevatedButton(
                onPressed: selectedGender != null
                    ? () {
                  // Navigate to the BodyTypeScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BodyTypeScreen()),
                  );
                }
                    : null, // Disable button if no gender is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGender != null ? Colors.black : Colors.grey, // Change color based on selection
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
            ),
          ],
        ),
      ),
    );
  }
}
