import 'package:flutter/material.dart';

class AppFonts {
  // Scalable Text Size based on Screen Width
  static double getHeadingOne(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.08; // Large Heading

  static double getHeadingTwo(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.06; // Subheading 1

  static double getHeadingThree(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05; // Subheading 2

  static double getBodyText(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04; // Default body text size

  static double getBodySmall(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.035; // Smaller body text

  static double getBodySmalltwo(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.025; // Smaller body text
  static double getBodySmallThree(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.015; // Smaller body text

  static double getCaption(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.028; // For captions and labels

  static double getButtonText(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.045; // Button text size

  static double getInputText(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04; // Text input field size

  static double getFooterText(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.03; // Footer text size (smaller)
}
