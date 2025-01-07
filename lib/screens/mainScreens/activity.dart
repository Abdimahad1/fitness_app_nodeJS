import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Section
            Text(
              "Statistics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Placeholder for the statistics graph
            Container(
              height: 200,
              color: Colors.blue.withOpacity(0.1), // Placeholder color
              child: Center(child: Text("Graph Placeholder")),
            ),
            SizedBox(height: 20),
            // Calories and Exercises Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatsCard(title: "Calories Burnt", value: "233"),
                StatsCard(title: "Exercises", value: "36"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContinueCard(title: "Chest Workout", progress: "5/12", timeRemaining: "15 min remaining"),
                ContinueCard(title: "Legs Workout", progress: "3/20", timeRemaining: "23 min remaining"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Stats Card Widget
class StatsCard extends StatelessWidget {
  final String title;
  final String value;

  StatsCard({required this.title, required this.value});

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
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(value, style: TextStyle(fontSize: 24)),
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