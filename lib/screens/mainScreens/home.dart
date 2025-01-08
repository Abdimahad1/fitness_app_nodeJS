import 'package:flutter/material.dart';
import 'activity.dart';
import 'workouts.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current selected index in the bottom nav bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome back 👋",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text("Jordan Eagle",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('lib/assets/images/user.png'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Section
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Progress",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.timer, size: 14, color: Colors.grey),
                              SizedBox(width: 5),
                              Text("3 hours", style: TextStyle(color: Colors.grey)),
                              SizedBox(width: 10),
                              Icon(Icons.star, size: 14, color: Colors.grey),
                              SizedBox(width: 5),
                              Text("Beginner", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Continue workout logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Continue the workout",
                                    style: TextStyle(color: Colors.white)),
                                Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "0%",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Recommendations Section
              Text("Recommendations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Column(
                children: [
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Pull Up",
                    duration: "15 minutes",
                    level: "Beginner",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Pull Up",
                            duration: "15 minutes",
                            level: "Beginner",
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Sit Up",
                    duration: "30 minutes",
                    level: "Intermediate",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Sit Up",
                            duration: "30 minutes",
                            level: "Intermediate",
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Biceps Curl",
                    duration: "2 hours",
                    level: "Advanced",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Biceps Curl",
                            duration: "2 hours",
                            level: "Advanced",
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Jumping Jacks",
                    duration: "10 minutes",
                    level: "Beginner",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Jumping Jacks",
                            duration: "10 minutes",
                            level: "Beginner",
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Leg Press",
                    duration: "45 minutes",
                    level: "Intermediate",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Leg Press",
                            duration: "45 minutes",
                            level: "Intermediate",
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Shoulder Press",
                    duration: "1 hour",
                    level: "Advanced",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Shoulder Press",
                            duration: "1 hour",
                            level: "Advanced",
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendationCard(
                    image: 'lib/assets/images/coach.png',
                    title: "Plank",
                    duration: "5 minutes",
                    level: "Beginner",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutsScreen(
                            title: "Plank",
                            duration: "5 minutes",
                            level: "Beginner",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
            if (index == 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ActivityScreen()));
            } else if (index == 2) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WorkoutsScreen(title: '', duration: '', level: '',)));
            } else if (index == 3) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          });
        },
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String level;
  final VoidCallback onTap;

  RecommendationCard({
    required this.image,
    required this.title,
    required this.duration,
    required this.level,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
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
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.timer, size: 14, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(duration, style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Icon(Icons.star, size: 14, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(level, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
