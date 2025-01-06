import 'package:flutter/material.dart';

class BodyTypeScreen extends StatefulWidget {
  @override
  _BodyTypeScreenState createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  String? selectedGoal; // Variable to hold the selected goal

  // Method to select a goal
  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal; // Update the selected goal
    });
  }

  // Method to get appropriate text for each selected goal
  String getAppreciativeText(String goal) {
    switch (goal) {
      case 'Lose Weight':
        return '🌟 Great choice! Let\'s achieve your weight loss goals together!';
      case 'Build Muscle':
        return '💪 Awesome! Building muscle will make you stronger!';
      case 'Keep Fit':
        return '🏃 Fantastic! Staying fit keeps you healthy!';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What\'s your main goal?'),
      ),
      body: Container(
        color: Colors.grey[200], // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
          children: [
            // Goal Selection Section
            Column(
              children: [
                GestureDetector(
                  onTap: () => selectGoal('Lose Weight'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedGoal == 'Lose Weight'
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.white, // Rectangle background color
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
                        // Text on the left
                        Expanded(
                          child: Text(
                            'Lose Weight',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // Image on the right
                        Image.asset(
                          'lib/assets/images/coach.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Appreciative Text for 'Lose Weight'
                if (selectedGoal == 'Lose Weight')
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1), // Low display background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      getAppreciativeText('Lose Weight'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                GestureDetector(
                  onTap: () => selectGoal('Build Muscle'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedGoal == 'Build Muscle'
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.white, // Rectangle background color
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
                        // Text on the left
                        Expanded(
                          child: Text(
                            'Build Muscle',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // Image on the right
                        Image.asset(
                          'lib/assets/images/coach.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Appreciative Text for 'Build Muscle'
                if (selectedGoal == 'Build Muscle')
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1), // Low display background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      getAppreciativeText('Build Muscle'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                GestureDetector(
                  onTap: () => selectGoal('Keep Fit'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedGoal == 'Keep Fit'
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.white, // Rectangle background color
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
                        // Text on the left
                        Expanded(
                          child: Text(
                            'Keep Fit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // Image on the right
                        Image.asset(
                          'lib/assets/images/coach.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

                // Appreciative Text for 'Keep Fit'
                if (selectedGoal == 'Keep Fit')
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1), // Low display background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      getAppreciativeText('Keep Fit'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
              ],
            ),

            Spacer(), // Adds space between the buttons and the Next button

            // Next Button Section
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Add space from the bottom
              child: ElevatedButton(
                onPressed: selectedGoal != null
                    ? () {
                  // Handle Next action
                }
                    : null, // Disable button if no goal is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGoal != null ? Colors.black : Colors.grey, // Change color based on selection
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
