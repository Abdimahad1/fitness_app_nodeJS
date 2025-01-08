import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'home.dart';
import 'workouts.dart';
import 'profile.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        return false; // Prevent default back action
      },
      child: Scaffold(
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
                Text(
                  "Statistics",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(showTitles: true, reservedSize: 40),
                        bottomTitles: SideTitles(showTitles: true),
                      ),
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 20),
                            FlSpot(1, 38),
                            FlSpot(2, 30),
                            FlSpot(3, 50),
                            FlSpot(4, 80),
                            FlSpot(5, 100),
                            FlSpot(6, 120),
                          ],
                          isCurved: true,
                          colors: [Colors.purple],
                          barWidth: 4,
                          belowBarData: BarAreaData(show: true, colors: [Colors.purple.withOpacity(0.1)]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Overview Section
                Text(
                  "Overview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    OverviewCard(
                      title: "Heart Rate",
                      value: "123",
                      unit: "Bpm",
                      icon: Icons.favorite,
                      iconColor: Colors.red,
                    ),
                    OverviewCard(
                      title: "Steps",
                      value: "2316",
                      unit: "Steps",
                      icon: Icons.directions_walk,
                      iconColor: Colors.orange,
                    ),
                    OverviewCard(
                      title: "Water Intake",
                      value: "1.8",
                      unit: "Liters",
                      icon: Icons.opacity,
                      iconColor: Colors.blue,
                    ),
                    OverviewCard(
                      title: "Calories Burnt",
                      value: "233",
                      unit: "Kcal",
                      icon: Icons.local_fire_department,
                      iconColor: Colors.deepOrange,
                    ),
                    OverviewCard(
                      title: "Exercises",
                      value: "36",
                      unit: "Sessions",
                      icon: Icons.fitness_center,
                      iconColor: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Continue Section
                Text(
                  "Continue",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ContinueCard(
                      title: "Chest Workout",
                      progress: "5/12",
                      timeRemaining: "15 min remaining",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutsScreen(
                              title: "Chest Workout",
                              duration: "15 minutes",
                              level: "Intermediate", // Adjust as needed
                            ),
                          ),
                        );
                      },
                    ),
                    ContinueCard(
                      title: "Legs Workout",
                      progress: "3/20",
                      timeRemaining: "23 min remaining",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutsScreen(
                              title: "Legs Workout",
                              duration: "30 minutes",
                              level: "Intermediate", // Adjust as needed
                            ),
                          ),
                        );
                      },
                    ),
                    ContinueCard(title: "Back Workout", progress: "2/10", timeRemaining: "10 min remaining"),
                    ContinueCard(title: "Arm Workout", progress: "4/15", timeRemaining: "20 min remaining"),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1, // Activity is the second tab (index 1)
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (index == 2) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WorkoutsScreen(title: '', duration: '', level: '',)));
            } else if (index == 3) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// Overview Card Widget
class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color iconColor;

  OverviewCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42, // Each card takes 42% of the screen width
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 30),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            unit,
            style: TextStyle(fontSize: 14, color: Colors.grey),
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
  final Function()? onTap;

  ContinueCard({
    required this.title,
    required this.progress,
    required this.timeRemaining,
    this.onTap,
  });

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
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(progress, style: TextStyle(fontSize: 14)),
          SizedBox(height: 5),
          Text(timeRemaining, style: TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }
}
