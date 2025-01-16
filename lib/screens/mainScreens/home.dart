import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../startUp/startNow.dart';
import 'workout.dart'; // Import WorkoutScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

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
                  Get.to(() => StartNowScreen());
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: 24, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "Back to Start",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Welcome Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('lib/assets/images/user.png'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Swipeable Progress Section
              Container(
                height: 150,
                child: PageView(
                  children: [
                    _buildProgressCard("Daily Progress", "30%", Colors.blue),
                    _buildProgressCard("Weekly Progress", "70%", Colors.green),
                    _buildProgressCard("Monthly Progress", "50%", Colors.orange),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Recommendations Header
              Text(
                "Recommended Workouts",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

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
                    ),
                    _buildRecommendationCard(
                      title: "Sit Up",
                      duration: "30 min",
                      level: "Intermediate",
                      color: Colors.green,
                      image: 'lib/assets/images/coach.png',
                    ),
                    _buildRecommendationCard(
                      title: "Biceps Curl",
                      duration: "45 min",
                      level: "Advanced",
                      color: Colors.orange,
                      image: 'lib/assets/images/coach.png',
                    ),
                    _buildRecommendationCard(
                      title: "Leg Press",
                      duration: "60 min",
                      level: "Advanced",
                      color: Colors.purple,
                      image: 'lib/assets/images/coach.png',
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
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
                Get.to(() => WorkoutScreen()); // Navigate to WorkoutScreen
              },
            ),
            _buildNavItem(
              icon: Icons.person,
              label: "Profile",
              index: 2,
              isSelected: _currentIndex == 2,
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Progress Card Widget
  Widget _buildProgressCard(String title, String progress, Color color) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
              SizedBox(height: 10),
              Text(
                progress,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                progress,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Recommendation Card Widget
  Widget _buildRecommendationCard({
    required String title,
    required String duration,
    required String level,
    required Color color,
    required String image,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
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
          SizedBox(width: 15),
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
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.timer, size: 14, color: color),
                    SizedBox(width: 5),
                    Text(duration, style: TextStyle(color: Colors.black54)),
                    SizedBox(width: 10),
                    Icon(Icons.star, size: 14, color: color),
                    SizedBox(width: 5),
                    Text(level, style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Enhanced Nav Item Widget
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 80, // Increase touchable width
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10),
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
            SizedBox(height: 5),
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
