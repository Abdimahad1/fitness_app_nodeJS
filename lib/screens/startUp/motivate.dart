import 'package:flutter/material.dart';
import 'birth.dart'; // Import the BirthScreen
import 'package:get/get.dart';

import 'bodyType.dart';

class MotivateScreen extends StatefulWidget {
  const MotivateScreen({super.key});

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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.offAll(() => const BodyTypeScreen()), // Changed to navigate back to BodyTypeScreen
            ),
          ),
        ),
        title: const Text("What motivates you the most?"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: motivations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: selectedMotivations[index]
                            ? Colors.blue.withOpacity(0.8)
                            : Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: selectedMotivations[index]
                            ? [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ]
                            : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            motivations[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedMotivations[index]
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                          if (selectedMotivations[index])
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
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
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                onPressed: selectedMotivations.contains(true)
                    ? () {
                  // Navigate to the BirthScreen
                  Get.offAll(() => const BirthScreen());
                }
                    : null, // Disable if no option is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  selectedMotivations.contains(true) ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60, vertical: 20),
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
