import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart';
import '../authentications/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    print("User in Profile Screen (initState): ${userController.user.value.name}"); // Debugging log
  }

  @override
  Widget build(BuildContext context) {
    print("User in Profile Screen (build): ${userController.user.value.name}"); // Debugging log

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _showLogoutDialog(context, userController);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User Icon
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade800,
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // User Name
              Obx(() {
                print("User name in Obx: ${userController.user.value.name}"); // Debugging log
                return Text(
                  userController.user.value.name.isNotEmpty
                      ? userController.user.value.name
                      : "Guest User",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }),
              const SizedBox(height: 30),

              // Profile Information Section
              Column(
                children: [
                  _buildProfileItem(
                    "Name",
                    userController.user.value.name,
                    Icons.person,
                        (newValue) => userController.updateUser(name: newValue),
                  ),
                  const SizedBox(height: 15),

                  _buildProfileItem(
                    "Gender",
                    userController.user.value.gender,
                    Icons.male,
                        (newValue) => userController.updateUser(gender: newValue),
                  ),
                  const SizedBox(height: 15),

                  _buildProfileItem(
                    "Your Goal",
                    userController.user.value.goal,
                    Icons.flag,
                        (newValue) => userController.updateUser(goal: newValue),
                  ),
                  const SizedBox(height: 15),

                  _buildProfileItem(
                    "Birth Year",
                    userController.user.value.birthYear,
                    Icons.cake,
                        (newValue) => userController.updateUser(birthYear: newValue),
                  ),
                  const SizedBox(height: 15),

                  _buildProfileItem(
                    "Height",
                    userController.user.value.height,
                    Icons.height,
                        (newValue) => userController.updateUser(height: newValue),
                  ),
                  const SizedBox(height: 15),

                  _buildProfileItem(
                    "Weight",
                    userController.user.value.weight,
                    Icons.monitor_weight,
                        (newValue) => userController.updateUser(weight: newValue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black, // Make the whole screen dark
    );
  }

  // Helper Widget to Build Profile Items
  Widget _buildProfileItem(
      String title, String value, IconData icon, Function(String) onUpdate) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade800, // Dark card background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30), // White icons
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for titles
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value.isNotEmpty ? value : "Not Set",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70, // Slightly dimmer white for values
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => showEditDialog(title, value, onUpdate),
            icon: const Icon(Icons.edit, color: Colors.white), // White edit icon
          ),
        ],
      ),
    );
  }

  // Method to show the edit dialog
  void showEditDialog(
      String title, String currentValue, Function(String) onUpdate) {
    final TextEditingController controller =
    TextEditingController(text: currentValue);

    Get.defaultDialog(
      backgroundColor: Colors.grey.shade900, // Dark background for dialog
      title: "Edit $title",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white), // White text input
        decoration: InputDecoration(
          hintText: "Enter new $title",
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.grey.shade800,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          onUpdate(controller.text);
          Get.back(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text("Update"),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(), // Close the dialog
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Cancel"),
      ),
    );
  }

  // Method to show logout confirmation dialog
  void _showLogoutDialog(BuildContext context, UserController userController) {
    Get.defaultDialog(
      backgroundColor: Colors.grey.shade900, // Dark dialog background
      title: "Log Out",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      content: const Text(
        "Are you sure you want to log out?",
        style: TextStyle(color: Colors.white70),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          // Clear user data and navigate to LoginScreen
          userController.logout();
          Get.offAll(() => const LoginScreen());
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Yes"),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(), // Close the dialog
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        child: const Text("No"),
      ),
    );
  }
}
