import 'package:flutter/material.dart';

class AppColor {
  static const Color blackColor = Color(0xFF000000);
  static const Color lightBlackColor = Color(0xFF2C3E50);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFFB2BABB);
  static const Color redColor = Color(0xFFC0392B);

  static const Color primaryColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFF2C3E50);

  static const Color backgroundColor = Color(0xFFE2E2E2);
  static const Color bgPrimaryColor = Color(0xFF8E44AD);
  static const Color bgSecondaryColor = Color(0xFFC39BD3);

  static const Color transparentColor = Colors.transparent;

  // Gradient Color for background
  static const LinearGradient gradientBackgroundColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      bgPrimaryColor,
      bgSecondaryColor,
      bgPrimaryColor,
    ],
  );

  // Gradient Color for Font
  static const LinearGradient gradientFontColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      bgPrimaryColor,
      bgSecondaryColor,
      bgPrimaryColor,
    ],
  );

  // Gradient Color for button
  static const LinearGradient gradientButtonColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      bgPrimaryColor,
      bgSecondaryColor,
    ],
  );
}
