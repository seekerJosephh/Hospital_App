import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';

const kcontentColor = Color(0xffF5F5F5);
const kprimaryColor = Color(0xffff660e);

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.bottomNavHeight(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.teal,
            size: AppSizes.iconSize(context),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle:
                      TextStyle(fontSize: AppFonts.getInputText(context)),
                  border: InputBorder.none),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: AppSizes.iconSize(context),
              ))
        ],
      ),
    );
  }
}
