import 'package:flutter/material.dart';
import 'activity.dart'; // Import the ActivityScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current selected index in the bottom nav bar
  String selectedCategory = "All"; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Flexio",
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message
              Text(
                "Start Strong and\nSet Your Fitness Goals",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              // 7x4 Challenge Rectangle
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text Section
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FULL BODY 7X4 CHALLENGE",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Start your body-toning journey to target all muscle groups and build your dream body in 4 weeks!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Handle start action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              elevation: 5,
                            ),
                            child: Text(
                              "START NOW",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    // Image Section
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'lib/assets/images/fullbody.png', // Replace with your image path
                        fit: BoxFit.cover,
                        height: 168, // Adjusted for better layout
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Progress Section
              Text(
                "Progress",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressCard(title: "Chest Workout", progress: "0/0", timeRemaining: "0 min remaining"),
                  ProgressCard(title: "Legs Workout", progress: "0/0", timeRemaining: "0 min remaining"),
                ],
              ),
              SizedBox(height: 20),
              // Categories Section
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton(
                      title: "All",
                      isSelected: selectedCategory == "All",
                      onPressed: () {
                        setState(() {
                          selectedCategory = "All";
                        });
                      },
                    ),
                    CategoryButton(
                      title: "Cardio",
                      isSelected: selectedCategory == "Cardio",
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Cardio";
                        });
                      },
                    ),
                    CategoryButton(
                      title: "Upper Body",
                      isSelected: selectedCategory == "Upper Body",
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Upper Body";
                        });
                      },
                    ),
                    CategoryButton(
                      title: "Lower Body",
                      isSelected: selectedCategory == "Lower Body",
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Lower Body";
                        });
                      },
                    ),
                    CategoryButton(
                      title: "More Workouts",
                      isSelected: selectedCategory == "More Workouts",
                      onPressed: () {
                        setState(() {
                          selectedCategory = "More Workouts";
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Category-Specific Rectangles
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: selectedCategory == "Cardio"
                    ? [
                  ExerciseCard(title: "Cardio Warm-Up", subtitle: "15 Exercises • 20 Min"),
                  ExerciseCard(title: "HIIT Cardio", subtitle: "12 Exercises • 25 Min"),
                ]
                    : selectedCategory == "Upper Body"
                    ? [
                  ExerciseCard(title: "Push-Ups", subtitle: "10 Exercises • 15 Min"),
                  ExerciseCard(title: "Pull-Ups", subtitle: "8 Exercises • 10 Min"),
                ]
                    : selectedCategory == "Lower Body"
                    ? [
                  ExerciseCard(title: "Squats", subtitle: "12 Exercises • 20 Min"),
                  ExerciseCard(title: "Lunges", subtitle: "10 Exercises • 15 Min"),
                ]
                    : selectedCategory == "More Workouts"
                    ? [
                  ExerciseCard(title: "Yoga", subtitle: "8 Exercises • 30 Min"),
                  ExerciseCard(title: "Stretching", subtitle: "6 Exercises • 15 Min"),
                ]
                    : [
                  ExerciseCard(title: "Full Body Warm-Up", subtitle: "20 Exercises • 22 Min"),
                  ExerciseCard(title: "Full Body Challenge", subtitle: "25 Exercises • 30 Min"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 1) {
              // Navigate to ActivityScreen when the activity icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityScreen()),
              );
            }
            // Add navigation logic here for other screens
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Progress Card Widget
class ProgressCard extends StatelessWidget {
  final String title;
  final String progress;
  final String timeRemaining;

  ProgressCard({required this.title, required this.progress, required this.timeRemaining});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(progress, style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          Text(timeRemaining, style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}

// Category Button Widget
class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryButton({required this.title, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          side: BorderSide(color: Colors.blue, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
        ),
      ),
    );
  }
}

// Exercise Card Widget
class ExerciseCard extends StatelessWidget {
  final String title;
  final String subtitle;

  ExerciseCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.fitness_center, color: Colors.blue, size: 40), // Replace with an appropriate icon or image
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
