import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../startUp/startNow.dart';
import 'workout.dart'; // Import the WorkoutScreen
import 'profile.dart';
import '../../controllers/user_controller.dart';
import 'workout_detail.dart'; // Import WorkoutDetailScreen for navigation
import 'plan.dart'; // Import the ReportScreen
import '../startUp/hello.dart'; // Import the HelloScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find<UserController>();
  int _currentIndex = 0; // Track the current index of the bottom navigation bar
  bool _isBreathTestAnimating = false;
  int _selectedTime = 10; // Default time for breath-holding challenge
  Timer? _timer;
  double _progress = 0.0;
  bool _isBreathHolding = false;
  bool _isPaused = false; // Tracks if the progress is paused
  List<String> _notifications = []; // Stores breath test results
  bool _hasNewNotification = false; // Tracks if there are new notifications

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
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _hasNewNotification = false; // Clear red dot
                  });
                  _showNotifications();
                },
              ),
              if (_hasNewNotification)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.assignment, color: Colors.white),
            onPressed: () {
               Get.to(() => const HelloScreen()); 
              // Add your report action here
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
                return Text(
                  "Welcome ${userController.user.value.name.isNotEmpty ? userController.user.value.name : 'User'}!",
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
            backgroundColor: Colors.black,
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
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.calendar_today, color: Colors.black),
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
              } else if (index == 3) {
                Get.to(() => const PlanScreen());
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
          return Dialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Increment and Decrement Buttons for Time Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_selectedTime > 10) {
                              _selectedTime -= 10;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove, color: Colors.white),
                      ),
                      Text(
                        "${_selectedTime ~/ 60} min ${_selectedTime % 60} sec",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_selectedTime < 180) {
                              _selectedTime += 10;
                            }
                          });
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Progress Circle
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.white24,
                        color: Colors.blue,
                        strokeWidth: 8,
                      ),
                      Text(
                        _progress >= 1.0
                            ? "Done"
                            : "${_selectedTime ~/ 60}:${_selectedTime % 60}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Instructions
                  const Text(
                    "Hold your breath and watch your progress!",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Buttons (Pause, Start, Cancel - Icons Only)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Pause Button
                      IconButton(
                        onPressed: _isBreathHolding
                            ? () {
                                setState(() {
                                  if (_isPaused) {
                                    _startBreathTest(setState); // Resume
                                  } else {
                                    _timer?.cancel();
                                  }
                                  _isPaused = !_isPaused;
                                });
                              }
                            : null,
                        icon: Icon(
                          _isPaused ? Icons.play_arrow : Icons.pause,
                          color: Colors.white,
                        ),
                        iconSize: 32,
                      ),

                      // Start Button
                      IconButton(
                        onPressed: !_isBreathHolding
                            ? () {
                                setState(() {
                                  _progress = 0.0;
                                  _isBreathHolding = true;
                                  _startBreathTest(setState);
                                });
                              }
                            : null,
                        icon: const Icon(Icons.play_arrow, color: Colors.blue),
                        iconSize: 32,
                      ),

                      // Cancel Button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _progress = 0.0;
                            _timer?.cancel();
                            _isBreathHolding = false;
                            _isPaused = false;
                          });
                        },
                        icon: const Icon(Icons.close, color: Colors.red),
                        iconSize: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
          _isPaused = false;

          // Add result to notifications
          _notifications.add(
              "You held your breath for $totalTime seconds. Great job!");
          _hasNewNotification = true;

          // Notify user
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

  void _showNotifications() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                if (_notifications.isEmpty)
                  const Text(
                    "No notifications yet.",
                    style: TextStyle(color: Colors.white70),
                  )
                else
                  ..._notifications.map((notification) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          notification,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )),
              ],
            ),
          ),
        );
      },
    );
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
