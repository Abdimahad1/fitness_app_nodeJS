import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart'; // Import UserController
import 'height.dart'; // Import the HeightScreen

class BirthScreen extends StatefulWidget {
  const BirthScreen({super.key});

  @override
  _BirthScreenState createState() => _BirthScreenState();
}

class _BirthScreenState extends State<BirthScreen> {
  int selectedYear = 2003; // Default selected year
  final List<int> years = List.generate(2025 - 1990 + 1, (index) => 1990 + index); // Years from 1990 to 2025
  final UserController userController = Get.find<UserController>(); // Access UserController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Birth Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.black12],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Title
            const Text(
              "What's your birth year?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Description Box
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "It will help us to adjust the workout that best suits your age group.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Scrollable Year Selector
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 60,
                physics: const FixedExtentScrollPhysics(),
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
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: isSelected ? 24 : 20,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue : Colors.white70,
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
                  // Update birth year in UserController
                  userController.updateUser(birthYear: selectedYear.toString());

                  // Navigate to the HeightScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HeightScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  elevation: 5,
                ),
                child: const Text(
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
