import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/views/editProfile_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? profileData;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/jsons/userprofile_data.json');
      final data = json.decode(response) as Map<String, dynamic>;
      setState(() {
        profileData = data;
      });
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Profile Section
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Stack(
              children: [
                // Profile Info
                profileData == null
                    ? const Center(child: CircularProgressIndicator())
                    : Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      profileData!['image'],
                                      fit: BoxFit.cover,
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ),
                                // Edit Icon Positioned Near Image
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Navigate to Edit Profile Screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalInfoScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              profileData!['name'],
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${profileData!['email']} | ${profileData!['phone']}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),

          // Options Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOptionTile(
                  context,
                  icon: Icons.edit,
                  title: "Edit profile information",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInfoScreen(),
                      ),
                    );
                  },
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.notifications,
                  title: "Notifications",
                  trailing: const Text(
                    "ON",
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.language,
                  title: "Language",
                  trailing: const Text(
                    "English",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.security,
                  title: "Security",
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.brightness_6,
                  title: "Theme",
                  trailing: const Text(
                    "Light mode",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                _buildOptionTile(
                  context,
                  icon: Icons.help_outline,
                  title: "Help & Support",
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.mail_outline,
                  title: "Contact us",
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy policy",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to Build ListTile Options
  Widget _buildOptionTile(BuildContext context,
      {required IconData icon,
      required String title,
      Widget? trailing,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
