import 'package:flutter/material.dart';
import 'height.dart'; // Import the HeightScreen

class BirthScreen extends StatefulWidget {
  @override
  _BirthScreenState createState() => _BirthScreenState();
}

class _BirthScreenState extends State<BirthScreen> {
  int selectedYear = 2003; // Default selected year
  final List<int> years = List.generate(2025 - 1990 + 1, (index) => 1990 + index); // Years from 1990 to 2025

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "02 ABOUT YOUR BODY",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20),
            // Title
            Text(
              "What's your birth year?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Description Box
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1), // Light blue background
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "It will help us to adjust the workout that best suits your age group.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Scrollable Year Selector
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 60, // Space between items
                physics: FixedExtentScrollPhysics(),
                diameterRatio: 2.0,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedYear = years[index];
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final year = years[index];
                    final isSelected = year == selectedYear;

                    return Center(
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: isSelected ? 24 : 20,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue : Colors.black54,
                        ),
                        child: Text(year.toString()),
                      ),
                    );
                  },
                  childCount: years.length,
                ),
              ),
            ),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the HeightScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HeightScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  elevation: 5,
                ),
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
