import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart';
import '../authentications/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          // Logout Icon
          IconButton(
            icon: const Icon(Icons.logout),
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
                backgroundColor: Colors.blue.shade100,
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),

              // User Name
              Obx(() {
                return Text(
                  userController.user.value.name.isNotEmpty
                      ? userController.user.value.name
                      : "Guest User",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                        (newValue) =>
                        userController.updateUser(birthYear: newValue),
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
    );
  }

  // Helper Widget to Build Profile Items
  Widget _buildProfileItem(
      String title, String value, IconData icon, Function(String) onUpdate) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey)),
                const SizedBox(height: 5),
                Text(value,
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => showEditDialog(title, value, onUpdate),
            icon: const Icon(Icons.edit, color: Colors.blue),
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
      title: "Edit $title",
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Enter new $title"),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          onUpdate(controller.text);
          Get.back(); // Close the dialog
        },
        child: const Text("Update"),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(), // Close the dialog
        child: const Text("Cancel"),
      ),
    );
  }

  // Method to show logout confirmation dialog
  void _showLogoutDialog(BuildContext context, UserController userController) {
    Get.defaultDialog(
      title: "Log Out",
      content: const Text("Are you sure you want to log out?"),
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
