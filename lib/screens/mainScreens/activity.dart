import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _currentIndex = 1; // Current index for the BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Activity",
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
              // Statistics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Statistics",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Last 7 days",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Custom Line Chart for Statistics
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomPaint(
                  painter: LineChartPainter(),
                  child: Container(),
                ),
              ),
              SizedBox(height: 20),
              // Calories and Exercises Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsCard(title: "Calories Burnt", value: "233", icon: Icons.local_fire_department),
                  StatsCard(title: "Exercises", value: "36", icon: Icons.fitness_center),
                ],
              ),
              SizedBox(height: 20),
              // Continue Section
              Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Continue Cards
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ContinueCard(title: "Chest Workout", progress: "5/12", timeRemaining: "15 min remaining"),
                  ContinueCard(title: "Legs Workout", progress: "3/20", timeRemaining: "23 min remaining"),
                  ContinueCard(title: "Back Workout", progress: "2/10", timeRemaining: "10 min remaining"),
                  ContinueCard(title: "Arm Workout", progress: "4/15", timeRemaining: "20 min remaining"),
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation to other screens
            if (index == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (index == 2) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalendarScreen())); // Replace with your CalendarScreen
            } else if (index == 3) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen())); // Replace with your ProfileScreen
            }
          });
        },
      ),
    );
  }
}

// Custom Line Chart Painter
class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final points = [
      Offset(0, size.height), // Start at (0, height)
      Offset(size.width * 0.2, size.height * 0.8),
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.4),
      Offset(size.width * 0.8, size.height * 0.2),
      Offset(size.width, size.height * 0.1), // End at (width, some height)
    ];

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var point in points) {
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);

    // Add a circle on each point
    final circlePaint = Paint()..color = Colors.blue;
    for (var point in points) {
      canvas.drawCircle(point, 4, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Stats Card Widget
class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  StatsCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          SizedBox(height: 10),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

// Continue Card Widget
class ContinueCard extends StatelessWidget {
  final String title;
  final String progress;
  final String timeRemaining;

  ContinueCard({required this.title, required this.progress, required this.timeRemaining});

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
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            progress,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            timeRemaining,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
