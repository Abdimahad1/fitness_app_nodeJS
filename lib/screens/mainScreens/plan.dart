import 'package:flutter/material.dart';
import '../../services/workout_service.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedLevel = 'beginner'; // Default level
  final TextEditingController _durationController = TextEditingController();

  List<dynamic> savedPlans = [];
  String? _editingPlanId; // Track the ID of the plan being edited

  void _savePlan() async {
    if (_formKey.currentState!.validate()) {
      final plan = {
        'title': _titleController.text,
        'description': _descriptionController.text,
        'level': _selectedLevel,
        'duration': _durationController.text,
      };

      try {
        if (_editingPlanId != null) {
          // Update existing plan
          await WorkoutService.updateWorkoutPlan(_editingPlanId!, plan);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Workout plan updated successfully!')),
          );
        } else {
          // Create new plan
          await WorkoutService.createWorkoutPlan(plan);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Workout plan saved successfully!')),
          );
        }
        _fetchWorkoutPlans(); // Refresh the list of plans
        _clearForm(); // Clear the form fields
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _fetchWorkoutPlans() async {
    try {
      final plans = await WorkoutService.fetchWorkoutPlans();
      setState(() {
        savedPlans = plans;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching workout plans: $e')),
      );
    }
  }

  void _deleteWorkoutPlan(String id) async {
    // Show confirmation dialog
    final confirmed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Plan'),
        content: const Text('Are you sure you want to delete this plan?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await WorkoutService.deleteWorkoutPlan(id);
        _fetchWorkoutPlans(); // Refresh the list of plans
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Workout plan deleted successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting workout plan: $e')),
        );
      }
    }
  }

  void _editWorkoutPlan(Map<String, dynamic> plan) {
    setState(() {
      _editingPlanId = plan['_id'];
      _titleController.text = plan['title'];
      _descriptionController.text = plan['description'];
      _selectedLevel = plan['level'];
      _durationController.text = plan['duration'];
    });
  }

  void _clearForm() {
    _titleController.clear();
    _descriptionController.clear();
    _durationController.clear();
    setState(() {
      _selectedLevel = 'beginner';
      _editingPlanId = null; // Reset editing state
    });
  }

  void _updatePlan(String id) async {
    final plan = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'level': _selectedLevel,
      'duration': _durationController.text,
    };

    try {
      await WorkoutService.updateWorkoutPlan(id, plan);
      _fetchWorkoutPlans(); // Refresh the list of plans
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWorkoutPlans(); // Fetch plans when the screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Plan"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black, // Dark background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildRoundedTextField(
                    controller: _titleController,
                    label: 'Title',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildRoundedTextField(
                    controller: _descriptionController,
                    label: 'Description',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedLevel,
                    decoration: InputDecoration(
                      labelText: 'Level',
                      labelStyle: const TextStyle(color: Colors.white), // White label text
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.white), // White border
                      ),
                    ),
                    dropdownColor: Colors.black, // Dropdown background color
                    items: ['beginner', 'intermediate', 'advanced']
                        .map((level) => DropdownMenuItem(
                      value: level,
                      child: Text(level, style: const TextStyle(color: Colors.white)), // White text
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedLevel = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildRoundedTextField(
                    controller: _durationController,
                    label: 'Duration (e.g., 30 mins)',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a duration';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _savePlan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White button background
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: Text(
                      _editingPlanId != null ? 'Update Plan' : 'Save Plan',
                      style: const TextStyle(color: Colors.black), // Black text
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Saved Plans:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // White text
            ),
            Expanded(
              child: ListView.builder(
                itemCount: savedPlans.length,
                itemBuilder: (context, index) {
                  final plan = savedPlans[index];
                  return _buildPlanCard(plan);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white), // White text
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white), // White label text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white), // White border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildPlanCard(Map<String, dynamic> plan) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      color: Colors.grey[850], // Dark card background
      child: ListTile(
        title: Text(plan['title'] ?? 'No Title', style: const TextStyle(color: Colors.white)), // White text
        subtitle: Text(
          '${plan['description'] ?? 'No Description'} - ${plan['level'] ?? 'No Level'} - ${plan['duration'] ?? 'No Duration'}',
          style: const TextStyle(color: Colors.white70), // Light grey text
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue), // Blue edit icon
              onPressed: () {
                _editWorkoutPlan(plan); // Fill form fields for editing
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red), // Red delete icon
              onPressed: () {
                _deleteWorkoutPlan(plan['_id']); // Call delete function
              },
            ),
          ],
        ),
      ),
    );
  }
}