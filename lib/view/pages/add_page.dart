import 'package:flutter/material.dart';
import 'package:online_shooz_shop/resources/app_style.dart';
import 'package:online_shooz_shop/resources/colors.dart';
import 'package:online_shooz_shop/resources/dimensions.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Add Page",
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
