import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../startUp/startNow.dart';
import 'workout.dart'; // Import the WorkoutScreen
import 'profile.dart';
import '../../controllers/user_controller.dart';
import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find<UserController>();
  int _currentIndex = 0; // Track the current index of the bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Get.offAll(() => const StartNowScreen()); // Navigate back to StartNowScreen
          },
        ),
        title: const Text("Home", style: TextStyle(color: Colors.white)), // White text
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.snackbar("Notifications", "You have no new notifications.");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message
              Obx(() {
                final userName = userController.user.value.name;
                return Text(
                  "Welcome ${userName.isNotEmpty ? userName : 'User'}!",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              }),
              const SizedBox(height: 20),

              // Breath Progress Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Daily Breath Test",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tap to test your breath-holding ability",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.air,
                      size: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Recommendations Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommended Workouts",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See More",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Grey color for "See More"
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Exercise Boxes
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildExerciseBox('lib/assets/images/absworkout.png', 'Abs Workout', '10 min', '15 reps'),
                  _buildExerciseBox('lib/assets/images/chest.png', 'Chest Workout', '15 min', '12 reps'),
                  _buildExerciseBox('lib/assets/images/arm.png', 'Arm Workout', '20 min', '10 reps'),
                  _buildExerciseBox('lib/assets/images/legwork.png', 'Leg Workout', '25 min', '15 reps'),
                  _buildExerciseBox('lib/assets/images/shoulder.png', 'Shoulder Workout', '30 min', '10 reps'),
                  _buildExerciseBox('lib/assets/images/cardioo.png', 'Cardio Workout', '30 min', '20 mins'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,  // Padding on the left
          right: 15.0, // Padding on the right
          bottom: 15.0, // Padding at the bottom
        ),
        child: Container(
          height: 80, // Height for the navigation bar
          decoration: BoxDecoration(
            color: Colors.black, // Dark background color for the navigation bar
            borderRadius: BorderRadius.circular(30), // Fully rounded corners
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent, // Transparent for container compatibility
            elevation: 0, // Remove shadow
            items: const [
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20, // Adjust size of the circle
                  backgroundColor: Colors.white,
                  child: Icon(Icons.home, color: Colors.black),
                ),
                label: '', // No label
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20, // Adjust size of the circle
                  backgroundColor: Colors.white,
                  child: Icon(Icons.fitness_center, color: Colors.black),
                ),
                label: '', // No label
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20, // Adjust size of the circle
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                label: '', // No label
              ),
            ],
            currentIndex: _currentIndex, // Set the current index
            selectedItemColor: Colors.white, // Active color
            unselectedItemColor: Colors.grey, // Inactive color (grey)
            onTap: (index) {
              setState(() {
                _currentIndex = index; // Update the current index
              });
              if (index == 1) {
                // Navigate to the WorkoutScreen when the workout icon is clicked
                Get.to(() => const WorkoutScreen());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseBox(String imagePath, String title, String duration, String reps) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), // Adjust opacity
                BlendMode.darken,
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150, // Adjust height to fit content
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$duration, $reps',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
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
