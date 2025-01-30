import 'dart:convert';
import 'package:http/http.dart' as http;

class WorkoutService {
  static const String baseUrl = 'http://10.0.2.2:5000/api/workout-plans';

  // Create a new workout plan
  static Future<void> createWorkoutPlan(Map<String, dynamic> plan) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(plan),
    );

    if (response.statusCode == 201) {
      print('Workout plan created successfully!');
    } else {
      throw Exception('Failed to create workout plan: ${response.body}');
    }
  }

  // Fetch all workout plans
  static Future<List<dynamic>> fetchWorkoutPlans() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch workout plans: ${response.body}');
    }
  }

  // Update a workout plan
  static Future<void> updateWorkoutPlan(String id, Map<String, dynamic> plan) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(plan),
    );

    if (response.statusCode == 200) {
      print('Workout plan updated successfully!');
    } else {
      throw Exception('Failed to update workout plan: ${response.body}');
    }
  }

  // Delete a workout plan
  static Future<void> deleteWorkoutPlan(String id) async {
    final url = Uri.parse('$baseUrl/$id'); // Assuming your API supports DELETE at this endpoint
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('Workout plan deleted successfully!');
    } else {
      throw Exception('Failed to delete workout plan: ${response.body}');
    }
  }
}