import 'package:flutter/material.dart';
import 'package:animations/animations.dart'; // For smooth transition animations
import 'bodyType.dart'; // Import the BodyTypeScreen

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender; // Variable to hold the selected gender

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender; // Update the selected gender
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
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        elevation: 5,
        title: const Text(
          'Select Gender',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Header
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "What's your gender?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Let us know you better",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Gender Selection - Centered
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Male Option
                        GestureDetector(
                          onTap: () => selectGender('Male'),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: selectedGender == 'Male'
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: selectedGender == 'Male'
                                    ? Colors.blue
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Image.asset(
                                  'lib/assets/images/coach.png',
                                  width: 80,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Male',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (selectedGender == 'Male')
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.blue,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Female Option
                        GestureDetector(
                          onTap: () => selectGender('Female'),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: selectedGender == 'Female'
                                  ? Colors.pink.withOpacity(0.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: selectedGender == 'Female'
                                    ? Colors.pink
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Image.asset(
                                  'lib/assets/images/coach.png',
                                  width: 80,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Female',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (selectedGender == 'Female')
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.pink,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Next Button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OpenContainer(
                    closedElevation: 5,
                    closedColor: selectedGender != null
                        ? Colors.white
                        : Colors.grey.shade800,
                    openColor: Colors.black,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    transitionDuration: const Duration(milliseconds: 500),
                    openBuilder: (context, _) => const BodyTypeScreen(),
                    closedBuilder: (context, openContainer) => GestureDetector(
                      onTap: selectedGender != null ? openContainer : null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // Reduced size
                        alignment: Alignment.center,
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            color: selectedGender != null
                                ? Colors.black
                                : Colors.white70,
                            fontSize: 16, // Reduced font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
