import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietsScreen extends StatelessWidget {
  const DietsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Use GetX for navigation
          },
        ),
        title: const Text(
          "Meal Plan",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: const [
          // Remove notification logic related to the controller
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Day Selector
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7, // Assuming 7 days
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle day selection logic here
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.teal.shade100),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Day $index", // Replace with actual day names
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Meal Type Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealTypeButton(
                    title: "Breakfast",
                    isSelected: false,
                    onTap: () {
                      // Handle meal type selection logic here
                    },
                  ),
                  MealTypeButton(
                    title: "Lunch",
                    isSelected: false,
                    onTap: () {
                      // Handle meal type selection logic here
                    },
                  ),
                  MealTypeButton(
                    title: "Dinner",
                    isSelected: false,
                    onTap: () {
                      // Handle meal type selection logic here
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Meals List
              const Text(
                "0 meals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: 0, // Assuming 0 meals initially
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return MealCard(
                    image: "",
                    title: "",
                    calories: "",
                    duration: "",
                    isSelected: false,
                    onTap: () {
                      // Handle meal selection logic here
                    },
                    onAdd: () {
                      // Handle add meal logic here
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealTypeButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const MealTypeButton({super.key, 
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal.shade100),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String image;
  final String title;
  final String calories;
  final String duration;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onAdd;

  const MealCard({super.key, 
    required this.image,
    required this.title,
    required this.calories,
    required this.duration,
    required this.isSelected,
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.orange, size: 16),
                      const SizedBox(width: 5),
                      Text(calories, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 10),
                      const Icon(Icons.timer, color: Colors.blue, size: 16),
                      const SizedBox(width: 5),
                      Text(duration, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected)
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
