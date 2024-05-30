import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/app_style.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';
import 'package:online_shooz_shop/view/screens/add_page.dart';
import 'package:online_shooz_shop/view/screens/cart_page.dart';
import 'package:online_shooz_shop/view/screens/home_page.dart';
import 'package:online_shooz_shop/view/screens/profile_page.dart';
import 'package:online_shooz_shop/view/screens/search_page.dart';
import 'package:online_shooz_shop/view/widgets/custom_bottom_navbar.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    AddPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: pageList[pageIndex],
      bottomNavigationBar: bottomNavbar(),
    );
  }

  SafeArea bottomNavbar() {
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
              onTap: () {},
              icon: Icons.home,
            ),
            CustomBottomNavbar(
              onTap: () {},
              icon: Icons.search,
            ),
            CustomBottomNavbar(
              onTap: () {},
              icon: Icons.add,
            ),
            CustomBottomNavbar(
              onTap: () {},
              icon: Icons.shopping_cart,
            ),
            CustomBottomNavbar(
              onTap: () {},
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}
