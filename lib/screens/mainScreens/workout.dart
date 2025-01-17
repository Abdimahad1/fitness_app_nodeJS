import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'workout_detail.dart'; // Import WorkoutDetailScreen

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

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
              // Back Arrow and Header
              GestureDetector(
                onTap: () {
                  Get.back(); // Return to HomeScreen
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back, size: 24, color: Colors.black),
                    SizedBox(width: 10),

                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Workout Header


              // Workout Recommendations Section
              Expanded(
                child: ListView(
                  children: [
                    _buildWorkoutCard(
                      title: "Strength Training",
                      duration: "45 min",
                      level: "Advanced",
                      color: Colors.green,
                      image: 'lib/assets/images/strength.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "Strength Training",
                          description: "A workout to build your strength and endurance.",
                          relatedWorkouts: [
                            {"title": "Deadlift", "duration": "20", "durationInSeconds": 1200, "icon": Icons.fitness_center},
                            {"title": "Squats", "duration": "15", "durationInSeconds": 900, "icon": Icons.sports},
                            {"title": "Bench Press", "duration": "25", "durationInSeconds": 1500, "icon": Icons.sports_handball},
                          ],
                        ));
                      },
                    ),
                    _buildWorkoutCard(
                      title: "Yoga Flow",
                      duration: "30 min",
                      level: "Beginner",
                      color: Colors.blue,
                      image: 'lib/assets/images/yoga.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "Yoga Flow",
                          description: "A calming workout to improve flexibility and mindfulness.",
                          relatedWorkouts: [
                            {"title": "Downward Dog", "duration": "10", "durationInSeconds": 600, "icon": Icons.self_improvement},
                            {"title": "Child Pose", "duration": "15", "durationInSeconds": 900, "icon": Icons.self_improvement},
                            {"title": "Warrior Pose", "duration": "20", "durationInSeconds": 1200, "icon": Icons.self_improvement},
                          ],
                        ));
                      },
                    ),
                    _buildWorkoutCard(
                      title: "HIIT",
                      duration: "20 min",
                      level: "Intermediate",
                      color: Colors.red,
                      image: 'lib/assets/images/hiit.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "HIIT",
                          description: "High-intensity interval training for burning calories fast.",
                          relatedWorkouts: [
                            {"title": "Jumping Jacks", "duration": "5", "durationInSeconds": 300, "icon": Icons.directions_run},
                            {"title": "Mountain Climbers", "duration": "10", "durationInSeconds": 600, "icon": Icons.sports_kabaddi},
                            {"title": "Burpees", "duration": "5", "durationInSeconds": 300, "icon": Icons.fitness_center},
                          ],
                        ));
                      },
                    ),
                    _buildWorkoutCard(
                      title: "Cardio Blast",
                      duration: "40 min",
                      level: "Advanced",
                      color: Colors.orange,
                      image: 'lib/assets/images/cardio.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "Cardio Blast",
                          description: "A heart-pumping workout to improve cardiovascular health.",
                          relatedWorkouts: [
                            {"title": "Running", "duration": "20", "durationInSeconds": 1200, "icon": Icons.directions_run},
                            {"title": "Cycling", "duration": "15", "durationInSeconds": 900, "icon": Icons.pedal_bike},
                            {"title": "Jump Rope", "duration": "5", "durationInSeconds": 300, "icon": Icons.sports},
                          ],
                        ));
                      },
                    ),
                    _buildWorkoutCard(
                      title: "Core Strength",
                      duration: "35 min",
                      level: "Intermediate",
                      color: Colors.purple,
                      image: 'lib/assets/images/core.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "Core Strength",
                          description: "Exercises to build core stability and balance.",
                          relatedWorkouts: [
                            {"title": "Plank", "duration": "10", "durationInSeconds": 600, "icon": Icons.stairs},
                            {"title": "Crunches", "duration": "15", "durationInSeconds": 900, "icon": Icons.fitness_center},
                            {"title": "Leg Raises", "duration": "10", "durationInSeconds": 600, "icon": Icons.arrow_upward},
                          ],
                        ));
                      },
                    ),
                    _buildWorkoutCard(
                      title: "Push-Up Challenge",
                      duration: "15 min",
                      level: "Beginner",
                      color: Colors.cyan,
                      image: 'lib/assets/images/pushupchallenge.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "Push-Up Challenge",
                          description: "Push yourself with this upper body workout.",
                          relatedWorkouts: [
                            {"title": "Wide Push Ups", "duration": "5", "durationInSeconds": 300, "icon": Icons.sports},
                            {"title": "Diamond Push Ups", "duration": "5", "durationInSeconds": 300, "icon": Icons.sports_kabaddi},
                            {"title": "Incline Push Ups", "duration": "5", "durationInSeconds": 300, "icon": Icons.self_improvement},
                          ],
                        ));
                      },
                    ),
                    _buildWorkoutCard(
                      title: "Stretch and Flex",
                      duration: "20 min",
                      level: "Beginner",
                      color: Colors.teal,
                      image: 'lib/assets/images/stretch.png',
                      onTap: () {
                        Get.to(() => const WorkoutDetailScreen(
                          title: "Stretch and Flex",
                          description: "Improve flexibility with this stretching routine.",
                          relatedWorkouts: [
                            {"title": "Hamstring Stretch", "duration": "5", "durationInSeconds": 300, "icon": Icons.self_improvement},
                            {"title": "Quadriceps Stretch", "duration": "5", "durationInSeconds": 300, "icon": Icons.self_improvement},
                            {"title": "Shoulder Stretch", "duration": "10", "durationInSeconds": 600, "icon": Icons.self_improvement},
                          ],
                        ));
                      },
                    ),
                    // Add more exercises here
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // Workout Card Widget
  Widget _buildWorkoutCard({
    required String title,
    required String duration,
    required String level,
    required Color color,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
}
