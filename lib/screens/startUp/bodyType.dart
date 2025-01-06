import 'package:flutter/material.dart';

class BodyTypeScreen extends StatefulWidget {
  @override
  _BodyTypeScreenState createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  String? selectedGoal; // Variable to hold the selected goal

  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal; // Update the selected goal
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What\'s your main goal?'),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Goal Selection Options
                  GestureDetector(
                    onTap: () => selectGoal('Lose Weight'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedGoal == 'Lose Weight' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedGoal == 'Lose Weight' ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset('lib/assets/images/coach.png', width: 60), // Icon image
                          SizedBox(width: 10),
                          Text(
                            'Lose Weight',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectGoal('Build Muscle'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedGoal == 'Build Muscle' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedGoal == 'Build Muscle' ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset('lib/assets/images/coach.png', width: 60), // Icon image
                          SizedBox(width: 10),
                          Text(
                            'Build Muscle',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectGoal('Keep Fit'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedGoal == 'Keep Fit' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedGoal == 'Keep Fit' ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset('lib/assets/images/coach.png', width: 60), // Icon image
                          SizedBox(width: 10),
                          Text(
                            'Keep Fit',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Add more space above the Next button
            SizedBox(height: 60), // Increased height for more space

            // Next Button
            ElevatedButton(
              onPressed: selectedGoal != null ? () {
                // Handle Next action
              } : null, // Disable button if no goal is selected
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedGoal != null ? Colors.black : Colors.grey, // Change color based on selection
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Increased padding for larger button
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
