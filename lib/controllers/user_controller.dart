import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../screens/authentications/login_screen.dart';

class UserController extends GetxController {
  static const String baseUrl = 'http://10.0.2.2:5000/api/users'; // Use this for Android Emulator

  var user = UserModel.empty().obs;

  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'role': 'user',
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);

        // Save the user details after registration
        user.value = UserModel(
          id: data['user']['_id'] ?? '',
          name: data['user']['username'] ?? '',
          gender: '',
          goal: '',
          birthYear: '',
          height: '',
          weight: '',
        );

        print("User registered: ${user.value.name}");
        print("User data after registration: ${user.value.toJson()}");

        return {
          'success': true,
          'data': data,
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
    final url = Uri.parse('$baseUrl/login');

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

        // Ensure user details are updated properly
        user.value = UserModel(
          id: data['user']['_id'] ?? '',
          name: data['user']['username'] ?? '', // Assign username properly
          gender: data['user']['gender'] ?? '',
          goal: data['user']['goal'] ?? '',
          birthYear: data['user']['birthYear'] ?? '',
          height: data['user']['height'] ?? '',
          weight: data['user']['weight'] ?? '',
        );

        print("User logged in: ${user.value.name}"); // Debugging log
        print("User data after login: ${user.value.toJson()}");

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

  void logout() {
    // Clear the user details on logout
    user.value = UserModel.empty();

    // Navigate back to the login screen
    Get.offAll(() => const LoginScreen());
  }

  void updateUser({String? name, String? gender, String? goal, String? birthYear, String? height, String? weight}) {
    if (name != null) user.value.name = name;
    if (gender != null) user.value.gender = gender;
    if (goal != null) user.value.goal = goal;
    if (birthYear != null) user.value.birthYear = birthYear;
    if (height != null) user.value.height = height;
    if (weight != null) user.value.weight = weight;
  }

  Future<Map<String, dynamic>> addWorkout(String userId, String workoutId, String workoutName, String duration) async {
    final url = Uri.parse('$baseUrl/add-workout'); // Update with your endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'workoutId': workoutId,
          'workoutName': workoutName,
          'duration': duration,
        }),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
        };
      } else {
        final error = jsonDecode(response.body);
        return {
          'success': false,
          'message': error['error'] ?? 'Failed to add workout',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }
}
