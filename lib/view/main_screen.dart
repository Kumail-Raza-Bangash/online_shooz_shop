import 'package:flutter/material.dart';
import 'package:online_shooz_shop/provider/main_screen_provider.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/view/pages/add_page.dart';
import 'package:online_shooz_shop/view/pages/cart_page.dart';
import 'package:online_shooz_shop/view/pages/home_page/home_page.dart';
import 'package:online_shooz_shop/view/pages/profile_page.dart';
import 'package:online_shooz_shop/view/pages/search_page.dart';
import 'package:online_shooz_shop/view/widgets/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
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
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
