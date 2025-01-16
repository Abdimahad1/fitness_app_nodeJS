import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'base_screen.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 1,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Added spacing at the top of the screen
              SizedBox(height: 30),

              // Statistics Section
              Text(
                "Statistics",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Added spacing below the heading
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
              SizedBox(height: 30), // Spacing between sections

              // Overview Section
              Text(
                "Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Added spacing below the heading
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
            ],
          ),
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
