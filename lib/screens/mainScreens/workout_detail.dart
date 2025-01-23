import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String reps;
  final List<Map<String, String>> relatedWorkouts;

  const WorkoutDetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.reps,
    required this.relatedWorkouts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title.isNotEmpty ? title : 'Workout Details',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Stack(
              children: [
                Image.asset(
                  imagePath.isNotEmpty
                      ? imagePath
                      : 'lib/assets/images/placeholder.png',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    title.isNotEmpty ? title : 'Unknown Workout',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Duration and Reps Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                      child: _infoCard(
                          "Duration", duration.isNotEmpty ? duration : 'Unknown')),
                  const SizedBox(width: 10),
                  Expanded(
                      child: _infoCard("Reps", reps.isNotEmpty ? reps : 'Unknown')),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Related Workouts Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                "Related Exercises",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Related Exercises List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: relatedWorkouts.isNotEmpty
                  ? Column(
                children: relatedWorkouts.map((workout) {
                  return _relatedWorkoutCard(
                    context,
                    workout['image'] ??
                        'lib/assets/images/placeholder.png',
                    workout['name'] ?? 'Unknown Exercise',
                    workout['reps'] ?? 'Unknown',
                  );
                }).toList(),
              )
                  : const Center(
                child: Text("No related exercises found."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _relatedWorkoutCard(
      BuildContext context, String imagePath, String title, String duration) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Related Workout Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),

          // Title and Duration
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1, // Limit to one line
                  overflow: TextOverflow.ellipsis, // Add ellipsis if overflow
                ),
                const SizedBox(height: 5),
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Clickable Arrow Icon
          GestureDetector(
            onTap: () {
              // Show pop-up dialog with the full image
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.topRight, // Align the cancel button to the top-right
                      children: [
                        // Full-Screen Image with Rounded Corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain, // Ensure full image visibility
                          ),
                        ),

                        // Cancel Icon Positioned on the Image
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.red, // Red background
                              radius: 20,
                              child: const Icon(Icons.close, color: Colors.white), // White icon
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
