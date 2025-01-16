import 'package:flutter/material.dart';
import 'home.dart';
import 'activity.dart';
import 'diets.dart';
import 'profile.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  BaseScreen({required this.child, required this.currentIndex});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Workouts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (index == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ActivityScreen()));
            } else if (index == 2) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DietsScreen()));
            } else if (index == 3) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          });
        },
      ),
    );
  }
} 