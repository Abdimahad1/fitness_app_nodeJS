import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../startUp/startNow.dart';
import 'workout.dart';
import 'profile.dart';
import '../../controllers/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    final userName = userController.user.value.name;
                    return Text(
                      "Welcome Back, ${userName.isNotEmpty ? userName : 'User'}!",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  }),

                ],
              ),
              const SizedBox(height: 20),

              // Breath Progress Section
              GestureDetector(
                onTap: () {
                  _showBreathPopup(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
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
              ),
              const SizedBox(height: 20),

              // Recommendations Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended Workouts",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => WorkoutScreen());
                    },
                    child: const Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Recommendations Section
              Expanded(
                child: ListView(
                  children: [
                    _buildRecommendationCard(
                      title: "Pull Up",
                      duration: "15 min",
                      level: "Beginner",
                      color: Colors.blue,
                      image: 'lib/assets/images/coach.png',
                      description: "A beginner-friendly workout to build upper body strength.",
                      relatedWorkouts: [
                        {"title": "Chin Ups", "duration": "10 min", "icon": Icons.fitness_center},
                        {"title": "Wide-Grip Pull Ups", "duration": "15 min", "icon": Icons.sports},
                      ],
                    ),
                    _buildRecommendationCard(
                      title: "Sit Up",
                      duration: "30 min",
                      level: "Intermediate",
                      color: Colors.green,
                      image: 'lib/assets/images/coach.png',
                      description: "An intermediate workout to strengthen your core.",
                      relatedWorkouts: [
                        {"title": "Crunches", "duration": "10 min", "icon": Icons.sports},
                        {"title": "Leg Raises", "duration": "20 min", "icon": Icons.self_improvement},
                      ],
                    ),
                    _buildRecommendationCard(
                      title: "Biceps Curl",
                      duration: "45 min",
                      level: "Advanced",
                      color: Colors.orange,
                      image: 'lib/assets/images/coach.png',
                      description: "Advanced bicep workout for strength and definition.",
                      relatedWorkouts: [
                        {"title": "Hammer Curls", "duration": "20 min", "icon": Icons.fitness_center},
                        {"title": "Concentration Curls", "duration": "25 min", "icon": Icons.sports},
                      ],
                    ),
                    _buildRecommendationCard(
                      title: "Leg Press",
                      duration: "60 min",
                      level: "Intermediate",
                      color: Colors.purple,
                      image: 'lib/assets/images/coach.png',
                      description: "An effective workout to strengthen your legs.",
                      relatedWorkouts: [
                        {"title": "Weighted Squats", "duration": "25 min", "icon": Icons.fitness_center},
                        {"title": "Lunges", "duration": "20 min", "icon": Icons.sports},
                      ],
                    ),
                    _buildRecommendationCard(
                      title: "Plank",
                      duration: "10 min",
                      level: "Beginner",
                      color: Colors.cyan,
                      image: 'lib/assets/images/coach.png',
                      description: "A simple core workout to build endurance.",
                      relatedWorkouts: [
                        {"title": "Side Plank", "duration": "5 min", "icon": Icons.sports_martial_arts},
                        {"title": "Plank with Shoulder Taps", "duration": "10 min", "icon": Icons.self_improvement},
                      ],
                    ),
                    _buildRecommendationCard(
                      title: "Push Up",
                      duration: "20 min",
                      level: "Beginner",
                      color: Colors.red,
                      image: 'lib/assets/images/coach.png',
                      description: "A great upper body workout for beginners.",
                      relatedWorkouts: [
                        {"title": "Diamond Push Ups", "duration": "10 min", "icon": Icons.fitness_center},
                        {"title": "Wide Push Ups", "duration": "15 min", "icon": Icons.sports_gymnastics},
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      // Simplified Bottom Navigation Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home,
              label: "Home",
              index: 0,
              isSelected: _currentIndex == 0,
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            _buildNavItem(
              icon: Icons.fitness_center,
              label: "Workout",
              index: 1,
              isSelected: _currentIndex == 1,
              onTap: () {
                Get.to(() => WorkoutScreen());
              },
            ),
            _buildNavItem(
              icon: Icons.person,
              label: "Profile",
              index: 2,
              isSelected: _currentIndex == 2,
              onTap: () {
                Get.to(() => ProfileScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  // Show Breath Popup Modal
  void _showBreathPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BreathTestWidget();
      },
    );
  }

  Widget _buildRecommendationCard({
    required String title,
    required String duration,
    required String level,
    required Color color,
    required String image,
    required String description,
    required List<Map<String, dynamic>> relatedWorkouts,
  }) {
    return GestureDetector(
      onTap: () {
        _showWorkoutModal(
          title: title,
          description: description,
          relatedWorkouts: relatedWorkouts,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.timer, size: 14, color: color),
                      const SizedBox(width: 5),
                      Text(duration, style: const TextStyle(color: Colors.black54)),
                      const SizedBox(width: 10),
                      Icon(Icons.star, size: 14, color: color),
                      const SizedBox(width: 5),
                      Text(level, style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWorkoutModal({
    required String title,
    required String description,
    required List<Map<String, dynamic>> relatedWorkouts,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              const Text(
                "Exercises",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ...relatedWorkouts.map((workout) {
                return ListTile(
                  leading: Icon(workout['icon'], color: Colors.blue),
                  title: Text(workout['title']),
                  trailing: Text(workout['duration']),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: isSelected
                  ? BoxDecoration(
                color: Colors.purple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              )
                  : null,
              child: Icon(
                icon,
                size: isSelected ? 28 : 24,
                color: isSelected ? Colors.purple : Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: isSelected ? 14 : 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.purple : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreathTestWidget extends StatefulWidget {
  @override
  _BreathTestWidgetState createState() => _BreathTestWidgetState();
}

class _BreathTestWidgetState extends State<BreathTestWidget> {
  int selectedDuration = 60;
  int remainingTime = 60;
  Timer? _timer;
  bool isRunning = false;

  void _startTimer() {
    if (_timer != null) _timer!.cancel();
    setState(() {
      remainingTime = selectedDuration;
      isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        isRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Hold Your Breath",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Select a duration and start holding your breath.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDurationButton(60, "1 Min"),
              _buildDurationButton(120, "2 Min"),
              _buildDurationButton(180, "3 Min"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "$remainingTime seconds remaining",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: (selectedDuration - remainingTime) / selectedDuration,
            minHeight: 8,
            color: Colors.green,
            backgroundColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  isRunning ? Icons.pause : Icons.play_arrow,
                  color: Colors.green,
                  size: 30,
                ),
                onPressed: () {
                  if (isRunning) {
                    _stopTimer();
                  } else {
                    _startTimer();
                  }
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.orange,
                  size: 30,
                ),
                onPressed: () {
                  _stopTimer();
                  setState(() {
                    remainingTime = selectedDuration;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDurationButton(int duration, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedDuration = duration;
          remainingTime = duration;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedDuration == duration ? Colors.blue : Colors.grey.shade300,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selectedDuration == duration ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
