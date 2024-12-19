import 'package:flutter/material.dart';

final List<Map<String, dynamic>> courses = [
  {
    'title': 'Wireframing Fundamentals',
    'author': 'Shoaib Hassan',
    'image': 'assets/images/wireframing.png',
    'progress': 35,
  },
  {
    'title': 'UI UX Designing',
    'author': 'HM Waqar',
    'image': 'assets/images/uiux.png',
    'progress': 35,
  },
  {
    'title': 'Website Design',
    'author': 'Adnan Yousaf',
    'image': 'assets/images/website_design.png',
    'progress': 35,
  },
  {
    'title': 'Figma Basics',
    'author': 'Usman Diljan',
    'image': 'assets/images/figma_basics.png',
    'progress': 35,
  },
];

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Courses', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            color: const Color(0xFF003096).withOpacity(0.05),
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFD9D9D9)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      course['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'By ${course['author']}',
                          style: const TextStyle(color: Color(0xFFD9D9D9)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${course['progress']}% Done',
                            style: const TextStyle(color: Color(0xFFD9D9D9), fontSize: 12),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Container(
                              height: 6,
                              width: MediaQuery.of(context).size.width *
                                  0.5 *
                                  (course['progress'] / 100),
                              decoration: BoxDecoration(
                                color: const Color(0xFF003096),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
