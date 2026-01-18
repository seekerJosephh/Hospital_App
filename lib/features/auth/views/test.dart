import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';
import 'package:hospital/features/auth/views/notification_screen.dart';
import 'package:hospital/pages/profile_page.dart';
import 'package:sidebarx/sidebarx.dart';

class CustomAppBar extends StatelessWidget {
  final SidebarXController sidebarController =
      SidebarXController(selectedIndex: 0);

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SidebarX for the Drawer Menu
        SidebarX(
          controller: sidebarController,
          theme: SidebarXTheme(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            textStyle: const TextStyle(color: Colors.white),
            selectedItemDecoration: const BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            iconTheme: const IconThemeData(color: Colors.white, size: 20),
          ),
          extendedTheme: const SidebarXTheme(
            width: 200,
            decoration: BoxDecoration(color: Colors.teal),
          ),
          headerBuilder: (context, extended) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
          items: [
            SidebarXItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                // Navigate to Home
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()),
                );
              },
            ),
            SidebarXItem(
              icon: Icons.person,
              label: 'Profile',
              onTap: () {
                // Navigate to Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            SidebarXItem(
              icon: Icons.settings,
              label: 'Settings',
              onTap: () {
                // Navigate to Settings (or other page)
              },
            ),
          ],
        ),
        // Custom App Bar
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              // Menu Icon
              IconButton(
                icon: Icon(
                  Icons.menu,
                  size: AppSizes.iconSize(context),
                  color: Colors.teal,
                ),
                onPressed: () {
                  // Toggle Sidebar
                  sidebarController.toggleExtended();
                },
              ),
              const SizedBox(width: 10),
              // Greeting Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: AppFonts.getInputText(context),
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Chetra Pang",
                    style: TextStyle(
                      fontSize: AppFonts.getInputText(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Notification Icon and Profile Picture
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.notifications_active,
                      size: AppSizes.iconSize(context),
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    borderRadius:
                        BorderRadius.circular(AppSizes.iconSizeTwo(context)),
                    child: CircleAvatar(
                      radius: AppSizes.iconSizeTwo(context),
                      backgroundImage:
                          const AssetImage('lib/assets/images/joseph.jpeg'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
