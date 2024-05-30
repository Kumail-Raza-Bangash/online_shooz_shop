import 'package:flutter/material.dart';
import 'package:online_shooz_shop/provider/main_screen_provider.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, myProvider, child) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(Dimensions.width10),
            margin: EdgeInsets.all(Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              color: AppColor.blackColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBottomNavbar(
                  onTap: () {
                    myProvider.pageIndex = 0;
                  },
                  icon: Icons.home,
                  iconColor: myProvider.pageIndex == 0
                      ? AppColor.whiteColor
                      : AppColor.greyColor,
                  iconSize: myProvider.pageIndex == 0
                      ? Dimensions.iconSize15 * 2
                      : Dimensions.iconSize25,
                ),
                CustomBottomNavbar(
                  onTap: () {
                    myProvider.pageIndex = 1;
                  },
                  icon: Icons.search,
                  iconColor: myProvider.pageIndex == 1
                      ? AppColor.whiteColor
                      : AppColor.greyColor,
                  iconSize: myProvider.pageIndex == 1
                      ? Dimensions.iconSize15 * 2
                      : Dimensions.iconSize25,
                ),
                CustomBottomNavbar(
                  onTap: () {
                    myProvider.pageIndex = 2;
                  },
                  icon: Icons.add,
                  iconColor: myProvider.pageIndex == 2
                      ? AppColor.whiteColor
                      : AppColor.greyColor,
                  iconSize: myProvider.pageIndex == 2
                      ? Dimensions.iconSize15 * 2
                      : Dimensions.iconSize25,
                ),
                CustomBottomNavbar(
                  onTap: () {
                    myProvider.pageIndex = 3;
                  },
                  icon: Icons.shopping_cart,
                  iconColor: myProvider.pageIndex == 3
                      ? AppColor.whiteColor
                      : AppColor.greyColor,
                  iconSize: myProvider.pageIndex == 3
                      ? Dimensions.iconSize15 * 2
                      : Dimensions.iconSize25,
                ),
                CustomBottomNavbar(
                  onTap: () {
                    myProvider.pageIndex = 4;
                  },
                  icon: Icons.person,
                  iconColor: myProvider.pageIndex == 4
                      ? AppColor.whiteColor
                      : AppColor.greyColor,
                  iconSize: myProvider.pageIndex == 4
                      ? Dimensions.iconSize15 * 2
                      : Dimensions.iconSize25,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CustomBottomNavbar extends StatelessWidget {
  IconData? icon;
  Function()? onTap;
  double iconSize;
  Color iconColor;

  CustomBottomNavbar({
    super.key,
    required this.icon,
    required this.onTap,
    required this.iconSize,
    required this.iconColor,
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
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
