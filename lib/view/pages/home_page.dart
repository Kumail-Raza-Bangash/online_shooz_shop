import 'package:flutter/material.dart';
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
      body: SizedBox(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child: Stack(
          children: [
            Container(
              height: Dimensions.screenHeight * 0.4,
              padding: EdgeInsets.fromLTRB(
                Dimensions.width10,
                Dimensions.height30,
                0,
                0,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
