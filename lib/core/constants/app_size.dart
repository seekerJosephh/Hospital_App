import 'package:flutter/material.dart';

class AppSizes {
  // Scalable Padding Sizes
  static double paddingSmall(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02; // Small Padding

  static double paddingMedium(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04; // Medium Padding

  static double paddingLarge(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.06; // Large Padding

  // Scalable Border Radius
  static double borderRadius(BuildContext context) =>
      MediaQuery.of(context).size.width *
      0.02; // Border radius (rounded corners)

  // Scalable Icon Size
  static double iconSize(BuildContext context) =>
      MediaQuery.of(context).size.width *
      0.08; // Icon Size (based on screen width)
  static double iconSizeTwo(BuildContext context) =>
      MediaQuery.of(context).size.width *
      0.06; // Icon Size (based on screen width)
  // Scalable Button Height
  static double buttonHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.12; // Height of buttons

  // Scalable Input Field Height
  static double inputFieldHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.12; // Height of input fields

  // Scalable Image Size (for images like logos or cards)
  static double imageSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.25; // Image size scaling

  // Scalable Card Size (for general UI cards)
  static double cardHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.5; // Height of cards
  static double cardsmallHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.3; // Height of cards

  static double cardWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9; // Width of cards

  // Scalable Line Height (used for text lines)
  static double lineHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02; // Line height spacing

  // Scalable Divider Thickness
  static double dividerThickness(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.003; // Divider line thickness

  // Scalable Header Height (for top navigation/header)
  static double headerHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.15; // Height for top header

  // Scalable Bottom Navigation Height
  static double bottomNavHeight(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.12; // Bottom Navigation Bar height
  static double Within(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.30; // Bottom Navigation Bar height
  static double Heighin(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.30; // Bottom Navigation Bar height
}
