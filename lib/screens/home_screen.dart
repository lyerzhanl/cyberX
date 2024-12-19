import 'package:edu_app/screens/notifications_screen.dart';
import 'package:edu_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'course_overview_screen.dart';

final List<Map<String, dynamic>> courses = [
  {
    'imageUrl': 'assets/images/Course_0.png',
    'courseTitle': 'Graphic Design',
    'courseAuthor': 'By Syed Hasnain',
    'doneBy': 45.0,
  },
  {
    'imageUrl': 'assets/images/Course_1.png',
    'courseTitle': 'Wireframing',
    'courseAuthor': 'By Shoaib Hassan',
    'doneBy': 70.0,
  },
  {
    'imageUrl': 'assets/images/Course_2.png',
    'courseTitle': 'Website Design',
    'courseAuthor': 'By Dawar Hanif',
    'doneBy': 30.0,
  },
  {
    'imageUrl': 'assets/images/Course_3.png',
    'courseTitle': 'Video Editing',
    'courseAuthor': 'By Ammar Ijaz',
    'doneBy': 85.0,
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Welcome, ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Fawais',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF003096),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings, color: Color(0xFFD9D9D9)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsScreen()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications, color: Color(0xFFD9D9D9)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NotificationsScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Here',
                    hintStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFFE3E3E3)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Category Chips
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryChip(label: 'UI/UX'),
                      CategoryChip(label: 'Graphics Design'),
                      CategoryChip(label: 'Figma'),
                    ],
                  ),
                ),

                // Continue Watching Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Continue Watching',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(color: Color(0xFFB7B0B0)),
                      ),
                    ),
                  ],
                ),

                // Render Cards from Course List
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.64,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: courses.length, // Number of courses
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return ContinueWatchingCard(
                      imageUrl: course['imageUrl'],
                      title: course['courseTitle'],
                      instructor: course['courseAuthor'],
                      progress: course['doneBy'] / 100, // Normalize progress
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFE3E3E3)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    );
  }
}

class ContinueWatchingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String instructor;
  final double progress;

  const ContinueWatchingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.instructor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseOverviewScreen(), // Navigate to the desired screen
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.white)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                imageUrl,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Title and Stars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5, // Generate 5 stars
                              (index) => const Icon(
                            Icons.star,
                            color: Color(0xFF003096),
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Instructor Name
                  Text(
                    instructor,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(progress * 100).toStringAsFixed(0)}% Done',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    backgroundColor: const Color(0xFFD9D9D9),
                    color: const Color(0xFF003096),
                    minHeight: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}