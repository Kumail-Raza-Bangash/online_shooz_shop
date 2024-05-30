import 'package:flutter/material.dart';
import 'package:online_shooz_shop/provider/main_screen_provider.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';
import 'package:online_shooz_shop/view/pages/add_page.dart';
import 'package:online_shooz_shop/view/pages/cart_page.dart';
import 'package:online_shooz_shop/view/pages/home_page.dart';
import 'package:online_shooz_shop/view/pages/profile_page.dart';
import 'package:online_shooz_shop/view/pages/search_page.dart';
import 'package:online_shooz_shop/view/widgets/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

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
    return Consumer<MainScreenProvider>(
      builder: (context, myProvider, child) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: pageList[myProvider.pageIndex],
          bottomNavigationBar: SafeArea(
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
                  ),
                  CustomBottomNavbar(
                    onTap: () {
                      myProvider.pageIndex = 1;
                    },
                    icon: Icons.search,
                  ),
                  CustomBottomNavbar(
                    onTap: () {
                      myProvider.pageIndex = 2;
                    },
                    icon: Icons.add,
                  ),
                  CustomBottomNavbar(
                    onTap: () {
                      myProvider.pageIndex = 3;
                    },
                    icon: Icons.shopping_cart,
                  ),
                  CustomBottomNavbar(
                    onTap: () {
                      myProvider.pageIndex = 4;
                    },
                    icon: Icons.person,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
