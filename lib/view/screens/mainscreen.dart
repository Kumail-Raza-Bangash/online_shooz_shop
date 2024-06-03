import 'package:flutter/material.dart';
import 'package:online_shooz_shop/controllers/mainscreen_provider.dart';
import 'package:online_shooz_shop/view/shared/bottom_nav.dart';
import 'package:online_shooz_shop/view/screens/cart_page/cart_page.dart';
import 'package:online_shooz_shop/view/screens/home_screen/home_page.dart';
import 'package:online_shooz_shop/view/screens/profile_page/profile_page.dart';
import 'package:online_shooz_shop/view/screens/search_page/search_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottoNavBar(),
        );
      },
    );
  }
}
