import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart'; // Import UserController
import 'motivate.dart'; // Import the MotivateScreen

class BodyTypeScreen extends StatefulWidget {
  const BodyTypeScreen({super.key});

  @override
  _BodyTypeScreenState createState() => _BodyTypeScreenState();
}

class _BodyTypeScreenState extends State<BodyTypeScreen> {
  String? selectedGoal; // Variable to hold the selected goal
  final UserController userController = Get.find<UserController>(); // Access the UserController

  // Method to select a goal and update the UserController
  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal; // Update the selected goal
    });
    userController.updateUser(goal: goal); // Update the goal in UserController
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          'What\'s your main goal?',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: selectedGoal == 'Lose Weight' ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Lose Weight',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Image.asset(
                              'lib/assets/images/looseweight.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (selectedGoal == 'Lose Weight')
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          getAppreciativeText('Lose Weight'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                    GestureDetector(
                      onTap: () => selectGoal('Build Muscle'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: selectedGoal == 'Build Muscle' ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Build Muscle',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Image.asset(
                              'lib/assets/images/buildmuscel.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (selectedGoal == 'Build Muscle')
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          getAppreciativeText('Build Muscle'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                    GestureDetector(
                      onTap: () => selectGoal('Keep Fit'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: selectedGoal == 'Keep Fit' ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Keep Fit',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Image.asset(
                              'lib/assets/images/keepfit.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (selectedGoal == 'Keep Fit')
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          getAppreciativeText('Keep Fit'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),

                // Next Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: ElevatedButton(
                    onPressed: selectedGoal != null
                        ? () {
                      Get.offAll(() => const MotivateScreen());
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedGoal != null ? Colors.black : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
