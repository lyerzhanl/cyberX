import 'package:edu_app/screens/get_enroll_screen.dart';
import 'package:flutter/material.dart';

class CourseOverviewScreen extends StatefulWidget {
  const CourseOverviewScreen({super.key});

  @override
  State<CourseOverviewScreen> createState() => _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends State<CourseOverviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark, color: Colors.white,),
              // icon: SvgPicture.asset('assets/images/Bookmark.svg'),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Video Section
            Stack(
              children: [
                // Background Image
                Container(
                  height: screenSize.height * 0.22,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Placeholder.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Center Icon
                Positioned.fill(
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.play_circle_outline,
                          size: 64, color: Colors.white),
                      onPressed: () {
                        // Handle video play
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Tab Bar
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF003096),
              labelColor: const Color(0xFF003096),
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Lessons'),
                Tab(text: 'Reviews'),
              ],
            ),

            // Tab Bar Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Overview Tab
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Course Title and Details
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Graphic Design',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'By Syed Hasnain',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Color(0xFF003096), size: 16),
                                    Icon(Icons.star,
                                        color: Color(0xFF003096), size: 16),
                                    Icon(Icons.star,
                                        color: Color(0xFF003096), size: 16),
                                    Icon(Icons.star,
                                        color: Color(0xFF003096), size: 16),
                                    Icon(Icons.star_border,
                                        color: Color(0xFF003096), size: 16),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '\$72',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Description
                        const Text(
                          'Lorem ipsum dolor sit amet consectetur. Nec eget accumsan molestie proin. Integer rhoncus vitae nisi natoque ac mus tellus scelerisque gravida. Consectetur aliquet sit at diam. Augue eu mauris suspendisse adipiscing nibh. Nibh lorem id eu suspendisse nulla leo hendrerit. Erat tortor commodo quam fames et molestie.',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Read More',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF003096)),
                        ),
                        const SizedBox(height: 16),

                        // Highlights
                        Container(
                          padding: const EdgeInsets.all(16), // Padding around the entire container
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF003096).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CourseHighlight(
                                        icon: Icons.video_library, label: '80+ Lectures'),
                                    SizedBox(height: 10),
                                    CourseHighlight(icon: Icons.timer, label: '8 Weeks'),
                                  ],
                                ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CourseHighlight(
                                        icon: Icons.check_circle_outline, label: 'Certificate'),
                                    SizedBox(height: 10),
                                    CourseHighlight(icon: Icons.local_offer, label: '10% Off'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Skills
                        const Text(
                          'Skills',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Wrap(
                          spacing: 8,
                          children: [
                            SkillChip(label: 'Adobe'),
                            SkillChip(label: 'Adobe Photoshop'),
                            SkillChip(label: 'Logo'),
                            SkillChip(label: 'Designing'),
                            SkillChip(label: 'Poster Design'),
                            SkillChip(label: 'Figma'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Lessons Tab
                  const SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Chapter 1
                        LessonCard(
                          chapterTitle: 'Chapter 1: What is Graphics Designing?',
                          lessons: [
                            {'icon': Icons.play_arrow, 'title': 'Lesson 1: Introduction to Graphics'},
                            {'icon': Icons.description, 'title': 'Lesson 2: Basic Tools'},
                            {'icon': Icons.play_arrow, 'title': 'Lesson 3: Layers and Effects'},
                            {'icon': Icons.description, 'title': 'Lesson 4: Practical Examples'},
                          ],
                        ),
                        SizedBox(height: 16),

                        // Chapter 2
                        LessonCard(
                          chapterTitle: 'Chapter 2: What is Logo Designing?',
                          lessons: [
                            {'icon': Icons.play_arrow, 'title': 'Lesson 1: Basics of Logo Design'},
                            {'icon': Icons.description, 'title': 'Lesson 2: Branding Essentials'},
                          ],
                        ),
                        SizedBox(height: 16),

                        // Chapter 3
                        LessonCard(
                          chapterTitle: 'Chapter 3: What is Poster Designing?',
                          lessons: [
                            {'icon': Icons.play_arrow, 'title': 'Lesson 1: Poster Templates'},
                            {'icon': Icons.description, 'title': 'Lesson 2: Poster Dimensions'},
                          ],
                        ),
                        SizedBox(height: 16),

                        // Chapter 4
                        LessonCard(
                          chapterTitle: 'Chapter 4: What is Picture Editing?',
                          lessons: [
                            {'icon': Icons.play_arrow, 'title': 'Lesson 1: Cropping Techniques'},
                            {'icon': Icons.description, 'title': 'Lesson 2: Filters and Adjustments'},
                          ],
                        ),
                      ],
                    ),
                  ),


                  // Reviews Tab
                  const SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Review 1
                        ReviewCard(
                          userName: 'Muhammad Arsalan',
                          role: 'Student',
                          reviewText:
                          'Lorem ipsum dolor sit amet consectetur. Euismod turpis tortor sollicitudin et. Quam tempor tincidunt a nunc feugiat semper tristique id.',
                          rating: 5,
                        ),
                        SizedBox(height: 16),

                        // Review 2
                        ReviewCard(
                          userName: 'Usman Diljan',
                          role: 'Student',
                          reviewText:
                          'Lorem ipsum dolor sit amet consectetur. Euismod turpis tortor sollicitudin et. Quam tempor tincidunt a nunc feugiat semper tristique id.',
                          rating: 4,
                        ),
                        SizedBox(height: 16),

                        // Review 3
                        ReviewCard(
                          userName: 'Yasir Lashari',
                          role: 'Student',
                          reviewText:
                          'Lorem ipsum dolor sit amet consectetur. Euismod turpis tortor sollicitudin et. Quam tempor tincidunt a nunc feugiat semper tristique id.',
                          rating: 5,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetEnrollScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003096),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'GET ENROLL',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseHighlight extends StatelessWidget {
  final IconData icon;
  final String label;

  const CourseHighlight({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF003096), size: 28),
        const SizedBox(width: 8),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFE3E3E3)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class LessonCard extends StatefulWidget {
  final String chapterTitle;
  final List<Map<String, dynamic>> lessons;

  const LessonCard({
    super.key,
    required this.chapterTitle,
    required this.lessons,
  });

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(width: 1, color: Color(0xFFD9D9D9))
      ),
      shadowColor: Colors.transparent,
      color: const Color(0xFF003096).withOpacity(0.05),
      child: Column(
        children: [
          // Chapter Header
          ListTile(
            title: Text(
              widget.chapterTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),

          // Lesson List (Collapsible)
          if (_isExpanded)
            Column(
              children: widget.lessons.map((lesson) {
                return ListTile(
                  leading: Icon(lesson['icon'], color: const Color(0xFF003096)),
                  title: Text(
                    lesson['title'],
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String userName;
  final String role;
  final String reviewText;
  final int rating;

  const ReviewCard({
    super.key,
    required this.userName,
    required this.role,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9))
      ),
      shadowColor: Colors.transparent,
      color: const Color(0xFF003096).withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Placeholder for user avatar
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFD9D9D9),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    // User Name and Role
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          role,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Rating Stars
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      size: 16,
                      color: index < rating
                          ? const Color(0xFF003096)
                          : const Color(0xFFD9D9D9),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Review Text
            Text(
              reviewText,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
