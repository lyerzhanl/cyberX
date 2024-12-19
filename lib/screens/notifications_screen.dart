import 'package:flutter/material.dart';

final List<Map<String, dynamic>> notifications = [
  {
    'icon': Icons.check_circle,
    'title': 'Transaction Successfully!',
    'subtitle': 'Lorem ipsum dolor sit amet consectetur.',
    'time': '5 mins ago',
    'color': const Color(0xFF003096)
  },
  {
    'icon': Icons.thumb_up,
    'title': 'Transaction Successfully!',
    'subtitle': 'Lorem ipsum dolor sit amet consectetur.',
    'time': '5 mins ago',
    'color': const Color(0xFF003096)
  },
  {
    'icon': Icons.check_circle,
    'title': 'Lorem ipsum',
    'subtitle': 'Lorem ipsum dolor sit amet consectetur.',
    'time': '5 mins ago',
    'color': const Color(0xFF003096)
  },
  {
    'icon': Icons.check_circle,
    'title': 'Lorem ipsum',
    'subtitle': 'Lorem ipsum dolor sit amet consectetur.',
    'time': '5 mins ago',
    'color': const Color(0xFF003096)
  },
];

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFFD9D9D9),),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF003096),),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shadowColor: Colors.transparent,
            color: const Color(0xFF003096).withOpacity(0.06),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFD9D9D9)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      notification['icon'],
                      color: const Color(0xFF003096),
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notification['subtitle'],
                              style: const TextStyle(fontSize: 11, color: Color(0xFF8E8787)),
                            ),
                            Text(
                              notification['time'],
                              style: const TextStyle(fontSize: 11, color: Color(0xFF8E8787)),
                            ),
                          ],
                        )
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
