import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../screens/authentications/login_screen.dart';

class UserController extends GetxController {
  static const String baseUrl = 'https://flutter-test-server.onrender.com';

  var user = UserModel(
    name: '',
    gender: '',
    goal: '',
    birthYear: '',
    height: '',
    weight: '',
  ).obs;

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/api/users/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
        };
      } else {
        final error = jsonDecode(response.body);
        return {
          'success': false,
          'message': error['error'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/users/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Save the logged-in user's details
        user.value = UserModel(
          name: data['name'] ?? '',
          gender: data['gender'] ?? '',
          goal: data['goal'] ?? '',
          birthYear: data['birthYear'] ?? '',
          height: data['height'] ?? '',
          weight: data['weight'] ?? '',
        );

        print("User logged in: ${user.value.name}");

        return {
          'success': true,
          'data': data,
        };
      } else {
        final error = jsonDecode(response.body);
        return {
          'success': false,
          'message': error['error'] ?? 'Invalid credentials',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }

  void updateUser({
    String? name,
    String? gender,
    String? goal,
    String? birthYear,
    String? height,
    String? weight,
  }) {
    print("Updating user data...");
    print("Current user data: ${user.value}");

    user.value.name = name ?? (user.value.name.isEmpty ? 'Guest' : user.value.name);
    user.value.gender = gender ?? user.value.gender;
    user.value.goal = goal ?? user.value.goal;
    user.value.birthYear = birthYear ?? user.value.birthYear;
    user.value.height = height ?? user.value.height;
    user.value.weight = weight ?? user.value.weight;

    print("Updated user data: ${user.value}");
  }

  // Logout Method
  void logout() {
    // Clear the user details on logout
    user.value = UserModel(
      name: '',
      gender: '',
      goal: '',
      birthYear: '',
      height: '',
      weight: '',
    );

    // Navigate back to the login screen
    Get.offAll(() => const LoginScreen());
  }
}
