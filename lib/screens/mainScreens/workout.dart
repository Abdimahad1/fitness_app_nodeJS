import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allWorkouts = [];
  List<Map<String, dynamic>> filteredWorkouts = [];
  List<Map<String, dynamic>> recommendedWorkouts = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    // Initialize workouts
    allWorkouts = [
      {'image': 'lib/assets/images/absworkout.png', 'title': 'Abs Workout', 'duration': '10 min', 'reps': '15 reps'},
      {'image': 'lib/assets/images/cardioo.png', 'title': 'Cardio Workout', 'duration': '30 min', 'reps': '20 mins'},
      {'image': 'lib/assets/images/chest.png', 'title': 'Chest Workout', 'duration': '15 min', 'reps': '12 reps'},
      {'image': 'lib/assets/images/arm.png', 'title': 'Arm Workout', 'duration': '20 min', 'reps': '10 reps'},
      {'image': 'lib/assets/images/legwork.png', 'title': 'Leg Workout', 'duration': '25 min', 'reps': '15 reps'},
      {'image': 'lib/assets/images/shoulder.png', 'title': 'Shoulder Workout', 'duration': '30 min', 'reps': '10 reps'},
      {'image': 'lib/assets/images/yoga.png', 'title': 'Yoga Flow', 'duration': '40 min', 'reps': 'Beginner'},
      {'image': 'lib/assets/images/boxing.png', 'title': 'Boxing Basics', 'duration': '20 min', 'reps': 'Intermediate'},
      {'image': 'lib/assets/images/pilates.png', 'title': 'Pilates', 'duration': '30 min', 'reps': 'Intermediate'},
      {'image': 'lib/assets/images/hiit.png', 'title': 'HIIT Workout', 'duration': '15 min', 'reps': 'High Intensity'},
      {'image': 'lib/assets/images/stretching.png', 'title': 'Stretching', 'duration': '20 min', 'reps': 'Beginner'},
    ];

    // Recommended workouts (specific subset of all workouts)
    recommendedWorkouts = [
      allWorkouts[0], // Abs Workout
      allWorkouts[2], // Chest Workout
    ];

    filteredWorkouts = List.from(allWorkouts);
  }

  void _filterWorkouts(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      if (query.isEmpty) {
        filteredWorkouts = List.from(allWorkouts);
      } else {
        filteredWorkouts = allWorkouts
            .where((workout) => workout['title']
            .toLowerCase()
            .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Workouts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explore Workouts",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: _filterWorkouts,
                decoration: InputDecoration(
                  hintText: "Search workouts...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 20),

              if (!isSearching) ...[
                // Recommended Workouts Section
                const Text(
                  "Recommended Workouts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: recommendedWorkouts
                      .map((workout) => _buildExerciseBox(
                      workout['image'],
                      workout['title'],
                      workout['duration'],
                      workout['reps'],
                      isRecommended: true))
                      .toList(),
                ),

                const SizedBox(height: 20),
              ],

              // All Workouts Section
              if (isSearching || filteredWorkouts.isNotEmpty)
                const Text(
                  "All Workouts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: filteredWorkouts
                    .map((workout) => _buildExerciseBox(
                    workout['image'],
                    workout['title'],
                    workout['duration'],
                    workout['reps']))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseBox(String imagePath, String title, String duration, String reps, {bool isRecommended = false}) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
        ),
        if (isRecommended)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Recommended",
                style: TextStyle(color: Colors.white, fontSize: 12),
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
    );
  }
}
