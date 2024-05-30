import 'package:flutter/material.dart';
import 'package:flutter_video_card_practice/resources/colors.dart';
import 'package:flutter_video_card_practice/resources/dimensions.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  const CustomButtonWidget({
    super.key, // Use Key? here
    required this.onPressed,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height05 / 2,
          horizontal: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          gradient: AppColor.gradientButtonColor,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
