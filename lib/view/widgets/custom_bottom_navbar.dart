import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';

// ignore: must_be_immutable
class CustomBottomNavbar extends StatelessWidget {
  IconData? icon;
  Function()? onTap;
  CustomBottomNavbar({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: Dimensions.height30,
        width: Dimensions.width30,
        child: Icon(
          icon,
          color: AppColor.whiteColor,
        ),
      ),
    );
  }
}
