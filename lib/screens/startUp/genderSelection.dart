import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart'; // Import UserController
import 'bodyType.dart';
import 'hello.dart'; // Import the BodyTypeScreen

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final UserController userController = Get.find<UserController>(); // Get the UserController
  String? selectedGender;

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
      userController.updateUser(gender: gender); // Update gender in UserController
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
              onPressed: () => Get.offAll(() => const HelloScreen()), // Changed to navigate back to HelloScreen
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
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
                          height: MediaQuery.of(context).size.width * 0.5,
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
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'lib/assets/images/male.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                          height: MediaQuery.of(context).size.width * 0.5,
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
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'lib/assets/images/female.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                  const SizedBox(height: 40),

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
                              horizontal: 20, vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              color: selectedGender != null
                                  ? Colors.black
                                  : Colors.white70,
                              fontSize: 16,
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
          ),
        ],
      ),
    );
  }
}
