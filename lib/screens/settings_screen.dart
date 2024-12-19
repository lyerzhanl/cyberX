import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF003096),),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFFD9D9D9),),
            onPressed: () {},
          ),
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
                    child: Card(
                      shadowColor: Colors.transparent,
                      color: const Color(0xFF003096).withOpacity(0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 50), // Space for the profile image
                          _buildSettingsItem(
                            icon: Icons.person,
                            title: 'Edit Profile',
                            onTap: () {},
                          ),
                          _buildSettingsItem(
                            icon: Icons.credit_card,
                            title: 'Payment Option',
                            onTap: () {},
                          ),
                          _buildSettingsItem(
                            icon: Icons.description,
                            title: 'Terms & Conditions',
                            onTap: () {},
                          ),
                          _buildSettingsItem(
                            icon: Icons.help_outline,
                            title: 'Help Center',
                            onTap: () {},
                          ),
                          _buildSettingsItem(
                            icon: Icons.group_add,
                            title: 'Invite Friends',
                            onTap: () {},
                          ),
                          _buildSettingsItem(
                            icon: Icons.logout,
                            title: 'Logout',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40, // Adjust this value to position the image correctly
                    left: MediaQuery.of(context).size.width / 2 - 50, // Center the image
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Avatar.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  // Виджет элемента настройки
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(icon, color: const Color(0xFF003096)),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
