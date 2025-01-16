import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class WorkoutDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> relatedWorkouts;

  WorkoutDetailScreen({
    required this.title,
    required this.description,
    required this.relatedWorkouts,
  });

  @override
  _WorkoutDetailScreenState createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  Map<String, dynamic> _activeExercise = {};
  Timer? _timer;
  int _remainingTime = 0;
  int _totalTime = 0;
  bool _isRunning = false;

  void _startTimer() {
    _isRunning = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _remainingTime = _totalTime;
    });
  }

  void _updateTimeFromSlider(double value) {
    setState(() {
      _remainingTime = (_totalTime - value).toInt();
      _stopTimer(); // Pause if the user interacts with the slider
    });
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow and Header
              GestureDetector(
                onTap: () {
                  Get.back(); // Return to WorkoutScreen
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: 24, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "Back to Workouts",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Workout Title and Description
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Related Workouts Header
              Text(
                "Exercises to Master",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

              // Related Workouts List
              Expanded(
                child: ListView.builder(
                  itemCount: widget.relatedWorkouts.length,
                  itemBuilder: (context, index) {
                    final workout = widget.relatedWorkouts[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _activeExercise = workout;
                              _remainingTime = workout['durationInSeconds'];
                              _totalTime = workout['durationInSeconds'];
                              _stopTimer(); // Stop previous timer if running
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      workout['icon'],
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      workout['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${workout['duration']} min",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Timer and Progress Bar
                        if (_activeExercise == workout)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              // Timer and Controls with Green Border
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // Timer Display
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${((_totalTime - _remainingTime) / 60).floor()}:${((_totalTime - _remainingTime) % 60).toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${(_totalTime / 60).floor()}:${(_totalTime % 60).toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Progress Slider
                                    Slider(
                                      value: (_totalTime - _remainingTime).toDouble(),
                                      min: 0,
                                      max: _totalTime.toDouble(),
                                      activeColor: Colors.red,
                                      inactiveColor: Colors.grey,
                                      onChanged: (value) {
                                        _updateTimeFromSlider(value);
                                      },
                                      onChangeEnd: (value) {
                                        if (_isRunning) _startTimer();
                                      },
                                    ),
                                    // Controls
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (_isRunning) {
                                              _stopTimer();
                                            } else {
                                              _startTimer();
                                            }
                                          },
                                          icon: Icon(
                                            _isRunning ? Icons.pause : Icons.play_arrow,
                                            color: Colors.green,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: _resetTimer,
                                          icon: Icon(
                                            Icons.restart_alt,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
