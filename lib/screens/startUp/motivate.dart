import 'package:flutter/material.dart';
import 'birth.dart'; // Import the BirthScreen

class MotivateScreen extends StatefulWidget {
  @override
  _MotivateScreenState createState() => _MotivateScreenState();
}

class _MotivateScreenState extends State<MotivateScreen> {
  List<String> motivations = [
    "🌟 Look more attractive",
    "💪 Get stronger",
    "❤️ Improve health",
    "😊 Feel confident",
    "⚡ Boost energy",
    "🧘 Release stress",
  ];

  List<bool> selectedMotivations = List.generate(6, (index) => false);

  void toggleSelection(int index) {
    setState(() {
      selectedMotivations[index] = !selectedMotivations[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What motivates you the most?"),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: motivations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedMotivations[index] ? Colors.blue.withOpacity(0.8) : Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Text with Emoji
                              Text(
                                motivations[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectedMotivations[index] ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          if (selectedMotivations[index])
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.check,
                                color: Colors.blue,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Next Button
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Add space from the bottom
              child: ElevatedButton(
                onPressed: selectedMotivations.contains(true)
                    ? () {
                        // Navigate to the BirthScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BirthScreen()),
                        );
                      }
                    : null, // Disable if no option is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedMotivations.contains(true) ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20), // Increased padding for larger button
                  elevation: 5, // Add shadow for depth
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
