import 'package:flutter/material.dart';
import 'workout_detail.dart'; // Import the WorkoutDetailScreen

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

    // Initialize workouts with associated exercises
    allWorkouts = [
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
        'image': 'lib/assets/images/back.png',
        'title': 'Back Workout',
        'duration': '30 min',
        'reps': '3 reps',
        'exercises': [
          {'image': 'lib/assets/images/pull_down.png', 'name': 'Lat Pulldown', 'reps': '12 reps'},
          {'image': 'lib/assets/images/seated_rows.png', 'name': 'Seated Rows', 'reps': '10 reps'},
          {'image': 'lib/assets/images/deadlift.png', 'name': 'Deadlifts', 'reps': '8 reps'},
        ],
      },
      {
        'image': 'lib/assets/images/yoga.png',
        'title': 'Yoga Flow',
        'duration': '40 min',
        'reps': 'Beginner',
        'exercises': [
          {'image': 'lib/assets/images/dog.png', 'name': 'Downward Dog', 'reps': 'Hold for 30 seconds'},
          {'image': 'lib/assets/images/worier_pose.png', 'name': 'Warrior Pose', 'reps': 'Hold for 30 seconds'},
          {'image': 'lib/assets/images/tree_pose.png', 'name': 'Tree Pose', 'reps': 'Hold for 30 seconds'},
        ],
      },
      {
        'image': 'lib/assets/images/boxing.png',
        'title': 'Boxing Basics',
        'duration': '20 min',
        'reps': 'Intermediate',
        'exercises': [
          {'image': 'lib/assets/images/plank.png', 'name': 'Jab-Cross', 'reps': '15 reps'},
          {'image': 'lib/assets/images/plank.png', 'name': 'Hooks', 'reps': '10 reps'},
          {'image': 'lib/assets/images/plank.png', 'name': 'Uppercuts', 'reps': '10 reps'},
        ],
      },
      {
        'image': 'lib/assets/images/hiit.png',
        'title': 'HIIT Workout',
        'duration': '15 min',
        'reps': 'High Intensity',
        'exercises': [
          {'image': 'lib/assets/images/burbees.png', 'name': 'Burpees', 'reps': '10 reps'},
          {'image': 'lib/assets/images/mountain.png', 'name': 'Mountain Climbers', 'reps': '30 seconds'},
          {'image': 'lib/assets/images/high_knees.png', 'name': 'High Knees', 'reps': '30 seconds'},
        ],
      },
      {
        'image': 'lib/assets/images/stretching.png',
        'title': 'Stretching Routine',
        'duration': '20 min',
        'reps': 'Beginner',
        'exercises': [
          {'image': 'lib/assets/images/harmstring.png', 'name': 'Hamstring Stretch', 'reps': 'Hold for 30 seconds'},
          {'image': 'lib/assets/images/quad.png', 'name': 'Quad Stretch', 'reps': 'Hold for 30 seconds'},
          {'image': 'lib/assets/images/shoulder_stretch.png', 'name': 'Shoulder Stretch', 'reps': 'Hold for 30 seconds'},
        ],
      },
    ];

    // Recommended workouts (specific subset of all workouts)
    recommendedWorkouts = [
      allWorkouts[0], // Abs Workout
      allWorkouts[1], // Chest Workout
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
                      .map((workout) => _buildExerciseBox(workout))
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
                    .map((workout) => _buildExerciseBox(workout))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
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
              relatedWorkouts: workout['exercises'], // Pass related exercises
            ),
          ),
        );
      },
      child: Stack(
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
    );
  }
}
