import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/app_style.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Page",
          style: appStyle(
            Dimensions.font15,
            AppColor.primaryColor,
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
