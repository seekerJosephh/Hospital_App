import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';
import 'package:hospital/features/auth/views/notification_screen.dart';
import 'package:hospital/pages/profile_page.dart';
import 'package:remixicon/remixicon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          // Menu Icon
          Icon(
            Icons.menu,
            size: AppSizes.iconSize(context),
            color: Colors.teal,
          ),
          SizedBox(width: 10),
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
          Spacer(),
          // Notification Icon and Profile Picture
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                  },
                  icon: Icon(
                    Icons.notifications_active,
                    size: AppSizes.iconSize(context),
                    color: Colors.teal,
                  )),
              SizedBox(width: 15),
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
                  backgroundImage: AssetImage('lib/assets/images/joseph.jpeg'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
