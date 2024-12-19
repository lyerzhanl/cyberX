import 'package:flutter/material.dart';

final List<Map<String, dynamic>> chats = [
  {
    'name': 'Ateeq Taj',
    'message': 'Hi, How’s you? How’s everything?',
    'time': '01:06 PM',
    'image': 'assets/images/ateeq.png',
    'unreadCount': 02,
  },
  {
    'name': 'Ateeq Taj',
    'message': 'Hi, How’s you? How’s everything?',
    'time': '01:06 PM',
    'image': 'assets/images/ateeq2.png',
    'unreadCount': 02,
  },
  {
    'name': 'Ateeq Taj',
    'message': 'Hi, How’s you? How’s everything?',
    'time': '01:06 PM',
    'image': 'assets/images/ateeq3.png',
    'unreadCount': 02,
  },
];

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Inbox', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Поле поиска
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Here',
                hintStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color(0xFFE3E3E3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          // Вкладки
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: const Color(0xFF003096),
              borderRadius: BorderRadius.circular(20),
            ),
            tabs: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Tab(text: 'Chat'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Tab(text: 'Calls'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.separated(
                  itemCount: chats.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(color: Colors.grey[300]),
                  ),
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(chat['image']),
                      ),
                      title: Text(
                        chat['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(chat['message']),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (chat['unreadCount'] > 0)
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF003096),
                              ),
                              child: Text(
                                '${chat['unreadCount']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          Text(
                            chat['time'],
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                ),

                const Center(child: Text('No calls available')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
