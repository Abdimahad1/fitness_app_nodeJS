import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../startUp/startNow.dart';
import 'workout.dart'; // Import the WorkoutScreen
import 'profile.dart';
import '../../controllers/user_controller.dart';
import 'workout_detail.dart'; // Import WorkoutDetailScreen for navigation

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find<UserController>();
  int _currentIndex = 0; // Track the current index of the bottom navigation bar
  bool _isBreathTestAnimating = false;
  int _selectedTime = 0;
  Timer? _timer;
  double _progress = 0.0;
  bool _isBreathHolding = false;

  // Recommended Workouts List
  final List<Map<String, dynamic>> recommendedWorkouts = [
    {
      'image': 'lib/assets/images/absworkout.png',
      'title': 'Abs Workout',
      'duration': '10 min',
      'reps': '3 reps',
      'exercises': [
        {'image': 'lib/assets/images/crunches.png', 'name': 'Crunches', 'reps': '15 reps'},
        {'image': 'lib/assets/images/plank.png', 'name': 'Plank', 'reps': '30 seconds'},
        {'image': 'lib/assets/images/leg_raises.png', 'name': 'Leg Raises', 'reps': '12 reps'},
      ],
    },
    {
      'image': 'lib/assets/images/chest.png',
      'title': 'Chest Workout',
      'duration': '15 min',
      'reps': '3 reps',
      'exercises': [
        {'image': 'lib/assets/images/pushupchallenge.png', 'name': 'Push-Ups', 'reps': '15 reps'},
        {'image': 'lib/assets/images/chest_press.png', 'name': 'Chest Press', 'reps': '12 reps'},
        {'image': 'lib/assets/images/diamond.png', 'name': 'Diamond Push-Ups', 'reps': '10 reps'},
      ],
    },
    {
      'image': 'lib/assets/images/arm.png',
      'title': 'Arm Workout',
      'duration': '20 min',
      'reps': '3 reps',
      'exercises': [
        {'image': 'lib/assets/images/curl.png', 'name': 'Bicep Curls', 'reps': '15 reps'},
        {'image': 'lib/assets/images/tricep.png', 'name': 'Tricep Dips', 'reps': '12 reps'},
        {'image': 'lib/assets/images/shoulder_press.png', 'name': 'Shoulder Press', 'reps': '10 reps'},
      ],
    },
    {
      'image': 'lib/assets/images/legwork.png',
      'title': 'Leg Workout',
      'duration': '25 min',
      'reps': '3 reps',
      'exercises': [
        {'image': 'lib/assets/images/squats.png', 'name': 'Squats', 'reps': '15 reps'},
        {'image': 'lib/assets/images/lunges.png', 'name': 'Lunges', 'reps': '12 reps'},
        {'image': 'lib/assets/images/leg_press.png', 'name': 'Leg Press', 'reps': '10 reps'},
      ],
    },
    {
      'image': 'lib/assets/images/shoulder.png',
      'title': 'Shoulder Workout',
      'duration': '30 min',
      'reps': '3 reps',
      'exercises': [
        {'image': 'lib/assets/images/over_head.png', 'name': 'Overhead Press', 'reps': '15 reps'},
        {'image': 'lib/assets/images/front.png', 'name': 'Front Raises', 'reps': '12 reps'},
        {'image': 'lib/assets/images/leteral.png', 'name': 'Lateral Raises', 'reps': '10 reps'},
      ],
    },
    {
      'image': 'lib/assets/images/cardioo.png',
      'title': 'Cardio Workout',
      'duration': '30 min',
      'reps': '3 reps',
      'exercises': [
        {'image': 'lib/assets/images/Jumping_Jacks.png', 'name': 'Jumping Jacks', 'reps': '20 reps'},
        {'image': 'lib/assets/images/burbees.png', 'name': 'Burpees', 'reps': '10 reps'},
        {'image': 'lib/assets/images/high_knees.png', 'name': 'High Knees', 'reps': '30 seconds'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAll(() => const StartNowScreen());
          },
        ),
        title: const Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.snackbar(
                "Notifications",
                "You have no new notifications.",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.cyanAccent,
                colorText: Colors.black,
                margin: const EdgeInsets.all(10),
                borderRadius: 15,
                animationDuration: const Duration(milliseconds: 500),
                duration: const Duration(seconds: 3),
                icon: const Icon(Icons.notifications, color: Colors.black),
              );
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
              _buildBreathTestCard(), // Breath test card
              const SizedBox(height: 20),
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
                      Get.to(() => const WorkoutScreen());
                    },
                    child: const Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: recommendedWorkouts
                    .map((workout) => _buildExerciseBox(workout))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.home, color: Colors.black),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.fitness_center, color: Colors.black),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                label: '',
              ),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 1) {
                Get.to(() => const WorkoutScreen());
              } else if (index == 2) {
                Get.to(() => const ProfileScreen());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBreathTestCard() {
    return GestureDetector(
      onTap: () {
        _showBreathTestDialog();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([]),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _isBreathTestAnimating ? 10 : 0), // Bounce effect
            child: child,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
              Icon(
                Icons.air,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBreathTestDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              "Choose a Challenge",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [10, 20, 30, 40, 50, 60, 120, 180].map((time) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedTime == time
                            ? Colors.blue
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedTime = time;
                          _progress = 0.0;
                        });
                      },
                      child: Text("${time ~/ 60}m ${time % 60}s"),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey.shade200,
                  color: Colors.blue,
                  minHeight: 10,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hold your breath until the timer finishes!",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              if (_isBreathHolding)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _timer?.cancel();
                      _progress = 0.0;
                      _isBreathHolding = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Restart"),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _isBreathHolding = false;
                    _progress = 0.0;
                    _timer?.cancel();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_selectedTime > 0) {
                    setState(() {
                      _isBreathHolding = true;
                    });
                    _startBreathTest(setState);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Start"),
              ),
            ],
          );
        },
      ),
    );
  }

  void _startBreathTest(StateSetter setState) {
    _progress = 0.0;
    _timer?.cancel();

    int totalTime = _selectedTime;
    int elapsedTime = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      elapsedTime += 1;
      setState(() {
        _progress = elapsedTime / (totalTime * 10);
        if (_progress >= 1.0) {
          timer.cancel();
          _isBreathHolding = false;
          Get.snackbar(
            "Congratulations!",
            "You held your breath for $totalTime seconds!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      });
    });
  }

  Widget _buildExerciseBox(Map<String, dynamic> workout) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetailScreen(
              imagePath: workout['image'],
              title: workout['title'],
              duration: workout['duration'],
              reps: workout['reps'],
              relatedWorkouts: workout['exercises'],
            ),
          ),
        );
      },
      child: Container(
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
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
                child: Image.asset(
                  workout['image'],
                  fit: BoxFit.cover,
                  height: 150,
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
                    workout['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${workout['duration']}, ${workout['reps']}',
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
      ),
    );
  }
}
