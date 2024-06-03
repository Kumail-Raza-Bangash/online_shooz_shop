import 'package:flutter/material.dart';
import 'package:online_shooz_shop/view/resources/colors.dart';

// ignore: must_be_immutable
class BotomNavWidget extends StatelessWidget {
  double iconSize;
  final void Function()? onTap;
  final IconData? icon;

  BotomNavWidget({
    super.key,
    this.onTap,
    this.icon,
    this.iconSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: 35,
        child: Icon(
          icon,
          color: AppColor.whiteColor,
          size: iconSize,
        ),
      ),
    );
  }
}
